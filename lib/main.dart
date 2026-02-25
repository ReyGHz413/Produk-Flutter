import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home.dart';




void main() {
  runApp(const MyApp());
  MaterialApp(
    debugShowCheckedModeBanner: false,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Produk',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Home(),
    );
  }
}