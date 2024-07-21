import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user);
    }
  }

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_form.currentState?.validate() ?? false) {
                _form.currentState?.save();

                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    email: _formData['email'] ?? '',
                    avatarUrl: _formData['avatarUrl'] ?? '',
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email é obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(
                  labelText: 'URL da Imagem',
                  hintText: 'Insira a URL da imagem (opcional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
