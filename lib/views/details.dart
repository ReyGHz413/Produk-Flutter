import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/api.dart';
import 'package:flutter_application_1/models/mproduk.dart';
import 'package:flutter_application_1/views/edit.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class Details extends StatefulWidget {
  final ProdukModel pw;
  const Details({super.key, required this.pw});

  @override
  State<Details> createState() => DetailsState();
}

class DetailsState extends State<Details> {

  
  
  // Fungsi untuk menghapus data produk
  void deleteProduk(context) async {
    try {
      http.Response response = await http.post(
        Uri.parse(BaseUrl.hapus),
        body: {
          'id': widget.pw.id.toString(),
        },
      );

      final data = json.decode(response.body);
      if (data['success'] == true) {
        pesan(); // Tampilkan toast
        // Kembali ke halaman utama dan refresh list
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        Fluttertoast.showToast(msg: "Gagal menghapus data");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Terjadi kesalahan: $e");
    }
  }

  // Menampilkan pesan toast sukses
  void pesan() {
    Fluttertoast.showToast(
      msg: "Penghapusan Data Berhasil disimpan",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Dialog konfirmasi sebelum hapus
  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Apakah anda yakin akan menghapus data ini?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(Icons.cancel, color: Colors.grey),
            ),
            ElevatedButton(
              onPressed: () => deleteProduk(context),
              child: const Icon(Icons.check_circle, color: Colors.red),
            ),
          ],
        );
      },
    );
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
        backgroundColor: Colors.blueAccent,
        // TAMBAHKAN ACTION UNTUK TOMBOL HAPUS
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () => confirmDelete(context), // Memanggil dialog konfirmasi
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.pw.foto,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pw.nama.toUpperCase(),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    detailRow(Icons.qr_code, "Kode Produk", widget.pw.kode),
                    detailRow(Icons.monetization_on, "Harga", "Rp ${widget.pw.harga}"),
                    detailRow(Icons.fingerprint, "ID System", widget.pw.id.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.edit, color: Colors.white),
        onPressed: () {
          // NAVIGASI KE HALAMAN EDIT
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Edit(pw: widget.pw), // Mengirim data ke Edit
            ),
          );
        },
      ),
    );
  }

// Widget kecil untuk baris detail
Widget detailRow(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 10),
        Text("$label : ", style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    ),
  );
}
}