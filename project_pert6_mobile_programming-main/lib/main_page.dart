import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu_1.dart';
import 'menu_2.dart';
import 'menu_3.dart';
import 'menu_4.dart';
import 'login_page.dart';

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
      appBar: AppBar(
        title: const Text('Menu Utama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false);
              
              if (!context.mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Menu 1 - Counter
            Card(
              child: ListTile(
                title: const Text('Menu 1 - Counter'),
                subtitle: const Text('Contoh penggunaan StatefulWidget dengan counter'),
                onTap: () => navigateTo(context, const Menu1()),
              ),
            ),
            
            // Menu 2 - Input Kalkulator
            Card(
              child: ListTile(
                title: const Text('Menu 2 - Input Kalkulator'),
                subtitle: const Text('Contoh input angka sederhana'),
                onTap: () => navigateTo(context, const Menu2()),
              ),
            ),
            
            // Menu 3 - Kalkulator
            Card(
              child: ListTile(
                title: const Text('Menu 3 - Kalkulator'),
                subtitle: const Text('Implementasi kalkulator dengan operasi dasar'),
                onTap: () => navigateTo(context, const Menu3()),
              ),
            ),
            
            // Menu 4 - Halaman Kosong
            Card(
              child: ListTile(
                title: const Text('Menu 4'),
                subtitle: const Text('Contoh halaman sederhana dengan tombol kembali'),
                onTap: () => navigateTo(context, const Menu4()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}