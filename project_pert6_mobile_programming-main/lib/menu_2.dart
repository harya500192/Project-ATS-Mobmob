import 'package:flutter/material.dart';

class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Menu 2')),
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