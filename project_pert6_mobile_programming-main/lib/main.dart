import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const FirstScreen());
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}