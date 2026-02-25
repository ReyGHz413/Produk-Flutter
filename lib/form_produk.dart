import 'package:flutter_application_1/produk_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/produk_page.dart';
import 'package:flutter_application_1/models/api.dart';

void main (){
  runApp(const MaterialApp(
    home: ProdukPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
        backgroundColor: Colors.black, // Warna AppBar
        foregroundColor: Colors.white, // Warna teks AppBar
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient( begin: Alignment.topLeft,
        end: Alignment.bottomRight, colors: [const Color.fromARGB(255, 5, 137, 245), Colors.black])),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Memberi jarak dari pinggir layar
          child: Column(
            children: [
              const SizedBox(height: 20), // Jarak dari atas
              _textboxKodeProduk(),
              const SizedBox(height: 20), // Jarak antar input
              _textboxNamaProduk(),
              const SizedBox(height: 20),
              _textboxHargaProduk(),
              const SizedBox(height: 40), // Jarak tombol agak jauh
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _textboxKodeProduk() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Kode Produk",
        labelStyle: TextStyle(color: Colors.white),
        hintText: "Contoh: P001", // Teks bayangan
        prefixIcon: const Icon(Icons.qr_code), // Ikon di kiri
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Garis tepi melengkung
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color.fromARGB(255, 250, 0, 0)), // Warna garis tepi saat tidak fokus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white), // Warna garis tepi saat fokus
        ),
      ),
      controller: _kodeProdukTextboxController,
    );
  }

  _textboxNamaProduk() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama Produk",
        labelStyle: TextStyle(color: Colors.white),
        hintText: "Contoh: Mie Instan",
        prefixIcon: const Icon(Icons.inventory_2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color.fromARGB(255, 250, 0, 0)), // Warna garis tepi saat tidak fokus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white), // Warna garis tepi saat fokus
        ),
      ),
      controller: _namaProdukTextboxController,
    );
  }

  _textboxHargaProduk() {
    return TextField(
      keyboardType: TextInputType.number, // Keyboard otomatis angka
      decoration: InputDecoration(
        labelText: "Harga",
        labelStyle: TextStyle(color: Colors.white),
        hintText: "Contoh: 5000",
        prefixIcon: const Icon(Icons.attach_money),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color.fromARGB(255, 250, 0, 0)), // Warna garis tepi saat tidak fokus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white), // Warna garis tepi saat fokus
        ),
      ),
      controller: _hargaProdukTextboxController,
    );
  }

  _tombolSimpan() {
    return SizedBox(
      width: double.infinity, // Tombol selebar layar
      height: 50, // Tinggi tombol
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Warna background
            foregroundColor: Colors.white, // Warna teks
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Sudut tombol melengkung
            ),
          ),
          onPressed: () {
            String kodeProduk = _kodeProdukTextboxController.text;
            String namaProduk = _namaProdukTextboxController.text;

            // Validasi sederhana: Jika harga kosong, anggap 0
            int harga = int.tryParse(_hargaProdukTextboxController.text) ?? 0;

            // Pindah ke halaman Detail
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      kodeProduk: kodeProduk,
                      namaProduk: namaProduk,
                      harga: harga,
                    )));
          },
          child: const Text(
            'SIMPAN DATA',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}