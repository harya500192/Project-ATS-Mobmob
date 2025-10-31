import 'package:flutter/material.dart';

class Menu4 extends StatelessWidget {
  const Menu4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Menu 4')),
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