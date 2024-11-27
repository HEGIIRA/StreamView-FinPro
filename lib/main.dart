import 'package:flutter/material.dart';
import 'package:stream_view/ui/home/components/recommend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner "debug"
      title: 'My Flutter App', // Nama aplikasi
      theme: ThemeData(
        fontFamily: 'Mulish',
        primarySwatch: Colors.blue, // Warna utama
      ),
      home: Recommend(), // Halaman utama
    );
  }
}
