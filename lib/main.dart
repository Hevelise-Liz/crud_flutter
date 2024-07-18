import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/user_list.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Flutter Demo',
           debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserList(),
      ),
    );
  }
}
 