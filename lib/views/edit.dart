import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/mproduk.dart';
import 'package:flutter_application_1/models/api.dart';
import 'package:flutter_application_1/widgets/form.dart';

class Edit extends StatefulWidget {
  final ProdukModel pw;
  const Edit({super.key, required this.pw});

  @override
  State<Edit> createState() => EditState();
}

class EditState extends State<Edit> {
  final formkey = GlobalKey<FormState>();
  
  // Mendefinisikan controller
  late TextEditingController namaController;
  late TextEditingController kodeController;
  late TextEditingController hargaController;
  late TextEditingController fotoController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data awal dari widget.pw
    namaController = TextEditingController(text: widget.pw.nama);
    kodeController = TextEditingController(text: widget.pw.kode);
    hargaController = TextEditingController(text: widget.pw.harga);
    fotoController = TextEditingController(text: widget.pw.foto);
  }

  Future editPw() async {
    return await http.post(
      Uri.parse(BaseUrl.edit),
      body: {
        "id": widget.pw.id.toString(),
        "nama": namaController.text,
        "kode": kodeController.text,
        "harga": hargaController.text,
        "foto": fotoController.text,
      },
    );
  }

  void pesan() {
    Fluttertoast.showToast(
      msg: "Perubahan Data Berhasil disimpan",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _onConfirm(context) async {
  try {
    http.Response response = await editPw();
    
    // Pastikan status code 200 (OK)
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      if (data['success'] == true) {
        pesan();
        // Kembali ke Home
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        // Jika PHP mengirim success: false
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal mengupdate: ${data['message'] ?? 'Error tidak diketahui'}")),
        );
      }
    } else {
      print("Server Error: ${response.statusCode}");
    }
  } catch (e) {
    // Menangkap error koneksi atau parsing JSON
    print("Terjadi kesalahan: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Koneksi gagal atau data tidak valid")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Produk"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: const Text("Update"),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onPressed: () {
            if (formkey.currentState!.validate()) {
              _onConfirm(context);
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: AppForm(
              formkey: formkey,
              namaController: namaController,
              kodeController: kodeController,
              hargaController: hargaController,
              fotoController: fotoController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Selalu dispose controller untuk mencegah memory leak
    namaController.dispose();
    kodeController.dispose();
    hargaController.dispose();
    fotoController.dispose();
    super.dispose();
  }
}