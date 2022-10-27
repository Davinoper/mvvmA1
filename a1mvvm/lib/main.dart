import 'package:flutter/material.dart';
import 'view/login.dart';
import 'view/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Login(),
    );
  }
}