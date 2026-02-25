import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/mproduk.dart';
import 'package:flutter_application_1/models/api.dart';
import 'package:flutter_application_1/views/details.dart';
import 'package:flutter_application_1/views/create.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<ProdukModel>> pw;

  @override
  void initState() {
    super.initState();
    pw = getPwList();
  }

  // Fungsi untuk menyegarkan data (Pull to Refresh)
  Future<void> _refreshData() async {
    setState(() {
      pw = getPwList();
    });
  }

  Future<List<ProdukModel>> getPwList() async {
    final response = await http.get(Uri.parse(BaseUrl.data));
    if (response.statusCode == 200) {
      final List items = json.decode(response.body);
      return items.map((json) => ProdukModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Warna latar belakang yang lebih soft
      appBar: AppBar(
        title: const Text(
          'Katalog Produk',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<List<ProdukModel>>(
          future: pw,
          builder: (BuildContext context, AsyncSnapshot<List<ProdukModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Belum ada produk tersedia"));
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data![index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: InkWell( // Agar card bisa ditekan dengan efek ripple
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Details(pw: data)
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // Menampilkan Gambar dari Link
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                data.foto,
                                fit: BoxFit.cover,
                                // Placeholder jika gambar sedang loading
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                                },
                                // Gambar default jika link error/kosong
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported, size: 40, color: Colors.grey);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          // Detail Produk
                          // Cari bagian Column di dalam itemBuilder dan ubah urutannya menjadi seperti ini:

Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 1. NAMA PRODUK (Sebagai Judul)
      Text(
        data.nama.toUpperCase(), // Menampilkan Nama Produk
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 5),
      
      // 2. KODE PRODUK (Sebagai Deskripsi)
      Text(
        "Kode: ${data.kode}", // Menampilkan Kode Produk
        style: TextStyle(
          color: Colors.grey[600], 
          fontSize: 14,
        ),
      ),
      const SizedBox(height: 10),
      
      // 3. HARGA PRODUK
      Text(
        "Rp ${data.harga}",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),
                          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Create()));
        },
        label: const Text("Produk", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}