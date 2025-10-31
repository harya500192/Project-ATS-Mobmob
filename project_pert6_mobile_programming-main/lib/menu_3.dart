import 'package:flutter/material.dart';

class Menu3 extends StatelessWidget {
  const Menu3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Menu 3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}