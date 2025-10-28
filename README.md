# Profil_Resto-Mie-Ayam-98

Aplikasi Flutter sederhana untuk menampilkan profil restoran (nama, gambar, ikon kontak, deskripsi, list menu, alamat, dan jam buka).

## Struktur UI
- Nama resto di bagian atas
- Gambar profil/banner
- Baris ikon kontak: Email, Map, Telepon
- Seksi Deskripsi
- Seksi List Menu (bullet)
- Seksi Alamat
- Seksi Jam Buka

UI diimplementasikan dengan kombinasi `Column`, `Row`, `Image.asset`, dan `IconButton` sesuai tugas.

## Cara Menjalankan

1) Instal Flutter SDK (jika belum)
	 - macOS: ikuti panduan resmi Flutter.
2) Buka folder proyek ini di terminal, lalu jalankan:

	 - Ambil dependency:
		 - `flutter pub get`
	 - Jalankan di device/emulator:
		 - `flutter run`

> Catatan: Pastikan ada device/emulator yang aktif (`flutter devices`).

## Assets Gambar
- File gambar dibaca dari `assets/images/profile.png` (lihat `pubspec.yaml`).
- Jika ingin memakai nama lain, ubah path pada `lib/main.dart` atau sesuaikan `pubspec.yaml`.

## Dependensi Utama
- `url_launcher` untuk membuka email, peta (Google Maps), dan telepon.

## Lisensi
Non-komersial untuk kebutuhan tugas/latihan.

