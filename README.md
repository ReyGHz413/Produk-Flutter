# 📱 Katalog Produk App (Flutter + PHP/MySQL)

[![Flutter](https://img.shields.io/badge/Framework-Flutter-blue.svg)](https://flutter.dev/)
[![PHP](https://img.shields.io/badge/Backend-PHP-777bb4.svg)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/Database-MySQL-4479a1.svg)](https://www.mysql.com/)

Aplikasi manajemen katalog produk sederhana namun powerful yang dibangun menggunakan **Flutter** untuk antarmuka pengguna dan **PHP/MySQL** sebagai sistem backend API-nya. Proyek ini mendemonstrasikan implementasi operasi CRUD (Create, Read, Update, Delete) secara real-time melalui koneksi HTTP.

---

## 🚀 Fitur Utama

* **List View Dinamis**: Menampilkan daftar produk dengan kartu (card) yang cantik, termasuk gambar produk langsung dari URL.
* **Detail Produk**: Tampilan detail yang rapi untuk melihat informasi lengkap seperti Nama, Kode, Harga, dan Foto.
* **Manajemen Data (CRUD)**:
    * **Tambah Produk**: Input data produk baru melalui form.
    * **Edit Produk**: Memperbarui informasi produk yang sudah ada.
    * **Hapus Produk**: Fitur penghapusan data dengan dialog konfirmasi untuk keamanan data.
* **Pull to Refresh**: Memperbarui daftar produk hanya dengan menarik layar ke bawah.
* **Penanganan Error**: Pesan error yang informatif jika koneksi gagal atau data tidak valid.

---

## 🛠️ Teknologi yang Digunakan

### Frontend (Mobile)
* **Dart & Flutter**: Framework utama.
* **Http**: Untuk komunikasi dengan REST API.
* **Fluttertoast**: Untuk memberikan feedback visual kepada pengguna.

### Backend (Server)
* **PHP (PDO)**: Untuk pemrosesan server-side yang aman terhadap SQL Injection.
* **MySQL**: Sebagai penyimpanan database relasional.
* **JSON**: Format pertukaran data antara server dan aplikasi.

---

## 📦 Struktur Database

Aplikasi ini menggunakan tabel `produk` dengan struktur sebagai berikut:

| Kolom | Tipe Data | Deskripsi |
| :--- | :--- | :--- |
| `id` | INT (Auto Increment) | Primary Key |
| `nama` | VARCHAR(225) | Nama Produk |
| `kode` | VARCHAR(225) | Kode Produk |
| `harga` | INT(250) | Harga Produk dalam angka |
| `foto` | VARCHAR(255) | Link/URL foto produk |

---

## 🔧 Cara Instalasi

1. **Clone Repositori**:
   ```bash
   git clone [https://github.com/ReyGHz413/Biodata-flutter.git](https://github.com/ReyGHz413/Biodata-flutter.git)
