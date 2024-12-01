import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';
import 'package:stream_view/ui/home/components/movie_banner.dart';
import 'package:stream_view/ui/home/components/recommend.dart';
import 'package:stream_view/ui/home/components/top_search.dart';
import 'package:stream_view/ui/home/home_screen.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Stream View',
      theme: ThemeData(
        fontFamily: 'Mulish',
      ),
      // home: RecommendBanner(), 
      // home: const HomeScreen(), 
      // home: const Recommend(), 
      home: const TopSearch(), 
    );
  }
}
