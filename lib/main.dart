import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/loginpage.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Mobile Lanjut",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 72, 130),
        ),
        body: LoginPage()),
    );
  }
}