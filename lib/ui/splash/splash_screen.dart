import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';

class SplashScreen extends StatefulWidget {
 const SplashScreen({super.key});

 @override
 SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
 @override
 void initState() {
   super.initState();
   Future.delayed(const Duration(seconds: 3), () {
     if (mounted) {
       Navigator.pushReplacementNamed(context, "/onBoarding");
     }
   });
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(
       children: [
         Container(
           color: primaryColor, // Warna ungu splash screen
         ),
         Align(
           alignment: Alignment.center,
           child: Image.asset(
             'assets/images/logo_streamview.png', // Gambar splash screen
             width: 200, // Ukuran logo
             fit: BoxFit.contain,
           ),
         ),
       ],
     ),
   );
 }
}