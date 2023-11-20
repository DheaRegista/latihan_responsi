import 'package:flutter/material.dart';
import 'base_network_news.dart';
import 'halaman_utama.dart';
import 'list_news.dart';
import 'list_blog.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Responsi',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HalamanUtama(),
    );
  }
}

