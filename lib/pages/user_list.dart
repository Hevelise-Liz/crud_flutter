import 'package:flutter/material.dart';

import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/widgets/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("LISTA DE USUÁRIOS")),
        actions: <Widget> [
          IconButton(
            color: Colors.green.shade800,
            onPressed: () {}, 
            icon: const 
            Icon(Icons.add_circle)),
            

        ]
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        )
    );
  }
}
