import 'package:flutter/material.dart';
import 'package:stream_view/ui/detail/detail_screen.dart';
import 'package:stream_view/ui/home/home_screen.dart';
import 'package:stream_view/ui/splash/on_boarding_screen.dart';
import 'package:stream_view/ui/splash/splash_screen.dart';

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

      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/onBoarding' : (context) => const OnBoardingScreen(),
        '/home' : (context) => const HomeScreen(),
        '/detail' : (context) => const DetailScreen(),

      },
    );
  }
}
