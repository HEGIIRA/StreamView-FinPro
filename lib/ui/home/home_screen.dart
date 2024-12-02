import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:stream_view/consts.dart';
import 'package:stream_view/models/movies.dart';
import 'package:stream_view/ui/detail/detail_screen.dart';
import 'package:stream_view/ui/home/components/bottom_navbar.dart';
import 'package:stream_view/ui/home/components/movie_banner.dart';
import 'package:stream_view/ui/home/components/recommend.dart';
import 'package:stream_view/ui/home/components/top_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
            backgroundColor: Colors.grey.shade200,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Mici",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Let's watch a movie",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: IconButton(
              icon: const Icon(
                IconsaxPlusLinear.search_normal_1,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: const Icon(
                IconsaxPlusLinear.notification,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView( // Body utama yang bisa di-scroll
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const MovieBanner(),
                  const SizedBox(height: 20),
                  Recommend(
                    movies: movie,
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TopSearch(),
                ],
              ),
            ),
          ),
          // Menambahkan BottomNavigationBar di bagian bawah layar dengan menggunakan Positioned
          const Positioned(
            bottom: 0, // Menempatkan BottomNavigationBar di bawah layar
            left: 0, // Menjaga agar tidak ada jarak di kiri
            right: 0, // Menjaga agar tidak ada jarak di kanan
            child: BottomNavBar(), // Memanggil BottomNavBar yang sudah dibuat sebelumnya
          ),
        ],
      ),
    );
  }
}
