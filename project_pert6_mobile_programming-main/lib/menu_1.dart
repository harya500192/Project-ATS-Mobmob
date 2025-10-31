import 'package:flutter/material.dart';

class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  int _jumlah = 0;

  void tambahAngka() {
    setState(() {
      _jumlah++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Jumlah: $_jumlah', style: TextStyle(fontSize: 34)),
            ElevatedButton(
              onPressed: () {
                tambahAngka();
              },
              child: Text('Tambah Angka'),
            ),
          ],
        )
      )
    );
  }
}