import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/mproduk.dart';
import 'package:flutter_application_1/models/api.dart';
import 'package:flutter_application_1/widgets/form.dart'; // Pastikan widget AppForm sudah benar

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // GlobalKey untuk validasi form
  final formkey = GlobalKey<FormState>();

  // Controller untuk menangkap input teks
  final namaController = TextEditingController();
  final kodeController = TextEditingController();
  final hargaController = TextEditingController();
  final fotoController = TextEditingController();

  // Fungsi untuk mengirim data ke API via POST
  Future<http.Response> createPw() async {
    return await http.post(
      Uri.parse(BaseUrl.tambah),
      body: {
        "nama": namaController.text,
        "kode": kodeController.text,
        "harga": hargaController.text,
        "foto": fotoController.text,
      },
    );
  }

  // Fungsi yang dipanggil saat tombol Simpan ditekan
  void _onConfirm(BuildContext context) async {
    try {
      final response = await createPw();
      final data = json.decode(response.body);

      // Cek apakah API mengembalikan status sukses
      if (data['success'] == true) {
        if (!mounted) return;
        
        // Tampilkan feedback sukses
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data berhasil disimpan!")),
        );

        // Kembali ke halaman utama dan hapus tumpukan navigasi
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal menyimpan data.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Terjadi kesalahan: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Produk"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onPressed: () {
            // Validasi form sebelum konfirmasi
            if (formkey.currentState!.validate()) {
              print("OK SUKSES");
              _onConfirm(context);
            }
          },
          child: const Text("Simpan"),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView( // Tambahkan agar tidak error pixel overflow
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: AppForm( // Pastikan parameter di widget form.dart sesuai
                formkey: formkey,
                namaController: namaController,
                kodeController: kodeController,
                hargaController: hargaController,
                fotoController: fotoController,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Bersihkan controller saat widget dihapus untuk menghemat memori
  @override
  void dispose() {
    namaController.dispose();
    kodeController.dispose();
    hargaController.dispose();
    fotoController.dispose();
    super.dispose();
  }
}