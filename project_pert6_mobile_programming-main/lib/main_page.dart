import 'package:flutter/material.dart';
import 'menu_1.dart';
import 'menu_2.dart';
import 'menu_3.dart';
import 'menu_4.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Utama')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Baris pertama
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => navigateTo(context, const Menu1()),
                  child: const Text('Menu 1'),
                ),
                ElevatedButton(
                  onPressed: () => navigateTo(context, const Menu2()),
                  child: const Text('Menu 2'),
                ),
              ],
            ),
            const SizedBox(height: 20), // Spasi antar baris
            // Baris kedua
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => navigateTo(context, const Menu3()),
                  child: const Text('Menu 3'),
                ),
                ElevatedButton(
                  onPressed: () => navigateTo(context, const Menu4()),
                  child: const Text('Menu 4'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}