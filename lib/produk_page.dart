import 'package:flutter_application_1/produk_detail.dart';
import 'package:flutter_application_1/form_produk.dart';
import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  // Kita simpan data dalam List agar kode lebih rapi dan mudah ditambah
  final List<Map<String, dynamic>> dataProduk = [
    {
      "kodeProduk": "P001",
      "namaProduk": "Choki-choki",
      "harga": 3500,
    },
    {
      "kodeProduk": "P002",
      "namaProduk": "Nasi Padang",
      "harga": 10000,
    },
    {
      "kodeProduk": "P003",
      "namaProduk": "Anggrek Mekar Pontianak",
      "harga": 50000, // Saya koreksi sedikit harganya agar masuk akal
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Warna background agak abu sedikit
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text(
          'Data Produk',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,
        end: Alignment.bottomRight,colors: [const Color.fromARGB(255, 5, 137, 245), Colors.black])),
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: dataProduk.length,
          itemBuilder: (context, index) {
            final produk = dataProduk[index];
            return ItemProduk(
              kodeProduk: produk['kodeProduk'],
              namaProduk: produk['namaProduk'],
              harga: produk['harga'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProdukForm()));
        },
        backgroundColor: Colors.blueAccent,
        icon: const Icon(Icons.add),
        label: const Text("Tambah Data"), // Menggunakan label agar lebih informatif
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      kodeProduk: kodeProduk,
                      namaProduk: namaProduk,
                      harga: harga,
                    )));
      },
      child: Card(
        elevation: 4, // Memberi efek bayangan
        margin: const EdgeInsets.symmetric(vertical: 8), // Jarak antar kartu
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Sudut melengkung
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Bagian Gambar/Icon (Kiri)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.blueAccent,
                  size: 30,
                ),
              ),
              const SizedBox(width: 15),
              // Bagian Teks (Tengah)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaProduk.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Kode: $kodeProduk",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Rp ${harga.toString()}", // Format sederhana mata uang
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              // Bagian Icon Panah (Kanan)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}