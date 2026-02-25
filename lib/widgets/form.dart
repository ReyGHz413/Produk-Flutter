import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AppForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController namaController;
  final TextEditingController kodeController;
  final TextEditingController hargaController;
  final TextEditingController fotoController;

  AppForm({
    required this.formkey,
    required this.namaController,
    required this.kodeController,
    required this.hargaController,
    required this.fotoController,
  });

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            txtNama(),
            SizedBox(height: 15),
            txtKode(),
            SizedBox(height: 15),
            txtHarga(),
            SizedBox(height: 15),
            txtFoto(),
          ],
        ),
      ),
    );
  }

  // --- Input Nama Produk ---
  Widget txtNama() {
    return TextFormField(
      controller: widget.namaController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nama Produk",
        prefixIcon: Icon(Icons.shopping_bag),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Masukkan Nama Produk.';
        return null;
      },
    );
  }

  // --- Input Kode Produk ---
  Widget txtKode() {
    return TextFormField(
      controller: widget.kodeController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Kode Produk",
        prefixIcon: Icon(Icons.qr_code),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Masukkan Kode Produk.';
        return null;
      },
    );
  }

  // --- Input Harga Produk ---
  Widget txtHarga() {
    return TextFormField(
      controller: widget.hargaController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Harga",
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Masukkan Harga.';
        if (int.tryParse(value) == null) return 'Harga harus berupa angka.';
        return null;
      },
    );
  }

  // --- Input Link Foto ---
  Widget txtFoto() {
    return TextFormField(
      controller: widget.fotoController,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(
        labelText: "Link Foto Produk",
        prefixIcon: Icon(Icons.image),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: "https://example.com/gambar.jpg"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Masukkan Link Foto.';
        return null;
      },
    );
  }
}