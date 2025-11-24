import 'package:flutter/material.dart';

// Contoh StatelessWidget sederhana
class Menu5 extends StatelessWidget {
  const Menu5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Sederhana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ini adalah contoh StatelessWidget',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'StatelessWidget tidak dapat menyimpan state',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali ke Menu Utama'),
            ),
          ],
        ),
      ),
    );
  }
}