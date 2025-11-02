# Aplikasi Mobile Programming

Aplikasi Flutter sederhana untuk pembelajaran konsep dasar mobile programming. Aplikasi ini mencakup implementasi berbagai widget dasar Flutter, manajemen state, dan navigasi antar halaman.

## Fitur Aplikasi

1. **Sistem Autentikasi**
   - Halaman Login
   - Halaman Register
   - Penyimpanan status login menggunakan SharedPreferences

2. **Menu Utama**
   - Navigasi ke 4 menu berbeda
   - Implementasi logout
   - Tampilan card untuk setiap menu

3. **Menu 1 - Counter App**
   - Implementasi StatefulWidget
   - Contoh penggunaan setState
   - Tombol increment dan decrement

4. **Menu 2 - Input Kalkulator**
   - Input angka sederhana
   - Tampilan hasil input
   - Reset input

5. **Menu 3 - Kalkulator**
   - Operasi matematika dasar (tambah, kurang, kali, bagi)
   - Display hasil kalkulasi
   - Error handling untuk pembagian dengan nol

6. **Menu 4 - Halaman Statis**
   - Implementasi StatelessWidget
   - Contoh tampilan sederhana

## Teknologi yang Digunakan

- Flutter
- Dart
- SharedPreferences untuk penyimpanan lokal

## Cara Menjalankan Aplikasi

1. Pastikan Flutter sudah terinstall di sistem Anda
2. Clone repository ini:
   ```bash
   git clone https://github.com/harya500192/Project-ATS-Mobmob.git
   ```
3. Masuk ke direktori project:
   ```bash
   cd project_pert6_mobile_programming-main
   ```
4. Install dependencies:
   ```bash
   flutter pub get
   ```
5. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Struktur Project

```
lib/
├── main.dart              # Entry point aplikasi
├── login_page.dart        # Halaman login
├── register_page.dart     # Halaman register
├── main_page.dart         # Halaman utama dengan menu
├── menu_1.dart           # Implementasi counter
├── menu_2.dart           # Input kalkulator
├── menu_3.dart           # Kalkulator lengkap
└── menu_4.dart           # Halaman statis
```

## Konsep Flutter yang Diimplementasikan

1. **Widget**
   - StatelessWidget
   - StatefulWidget
   - Material Design widgets

2. **State Management**
   - setState
   - Local state management

3. **Navigasi**
   - Navigator.push
   - Navigator.pushReplacement
   - Navigator.pop

4. **Penyimpanan Lokal**
   - SharedPreferences untuk menyimpan status login

5. **Input dan Event Handling**
   - onPressed callbacks
   - TextEditingController
   - Form validation

## Pembelajaran yang Bisa Didapat

1. Dasar-dasar Flutter dan Dart
2. Perbedaan StatelessWidget dan StatefulWidget
3. Implementasi navigasi antar halaman
4. Pengelolaan state sederhana
5. Penggunaan penyimpanan lokal
6. Pembuatan UI responsif
7. Penanganan input pengguna

## Kontribusi

Jika Anda ingin berkontribusi pada project ini, silakan:
1. Fork repository
2. Buat branch baru
3. Commit perubahan Anda
4. Push ke branch
5. Buat Pull Request

## Lisensi

Project ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](LICENSE) untuk detail.
