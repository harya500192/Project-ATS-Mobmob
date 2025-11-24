// menu_4.dart
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu4 extends StatefulWidget {
  const Menu4({super.key});

  @override
  State<Menu4> createState() => _Menu4State();
}

class _Menu4State extends State<Menu4> {
  int _counter = 0; // jumlah antrian yang sudah dibuat
  String? _lastKode; // kode_registrasi terakhir yang digenerate
  List<String> _queue = []; // daftar kode_registrasi antrian (FIFO)

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('queue_counter') ?? 0;
      _queue = prefs.getStringList('queue_list') ?? [];
      _lastKode = prefs.getString('last_kode');
    });
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('queue_counter', _counter);
    await prefs.setStringList('queue_list', _queue);
    if (_lastKode != null) {
      await prefs.setString('last_kode', _lastKode!);
    } else {
      await prefs.remove('last_kode');
    }
  }

  void _daftarAntrian() async {
    setState(() {
      _counter += 1;
      _lastKode = 'PLU${100000 + _counter}';
      _queue.add(_lastKode!);
    });
    await _saveState();
  }

  Future<void> _resetAllConfirm() async {
    final ok = await showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Antrian'),
        content: const Text('Reset seluruh antrian dan counter ke awal?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Reset')),
        ],
      ),
    );

    if (ok != true) return;

    setState(() {
      _counter = 0;
      _lastKode = null;
      _queue.clear();
    });
    await _saveState();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Selesai'),
        content: const Text('Antrian dan counter telah di-reset'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu 4 - Antrian (Sederhana)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Daftar Antrian', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.how_to_reg),
                      label: const Text('Daftar Antrian'),
                      onPressed: _daftarAntrian,
                    ),
                    const SizedBox(height: 12),
                    if (_lastKode != null)
                      Center(
                        child: Column(
                          children: [
                            PrettyQr(
                              image: null,
                              size: 160,
                              data: _lastKode!,
                              errorCorrectLevel: QrErrorCorrectLevel.M,
                              roundEdges: true,
                            ),
                            const SizedBox(height: 8),
                            Text('Kode registrasi: $_lastKode'),
                            const SizedBox(height: 4),
                            Text('Nomor antrian: $_counter'),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.delete_forever),
                              label: const Text('Reset Antrian'),
                              onPressed: _resetAllConfirm,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: ListTile(
                title: const Text('Informasi Antrian'),
                subtitle: Text('Total antrian terdaftar: ${_queue.length}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}