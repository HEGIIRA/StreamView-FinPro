import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';
import 'package:stream_view/models/movies.dart';
import 'package:stream_view/ui/home/components/movie_banner.dart';
import 'package:stream_view/ui/home/components/recommend.dart';

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
        // backgroundColor: Colors.orange,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/pp-1.jpg'),
            backgroundColor: Colors.grey.shade200,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Hegira", 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: blackTextColor
                )
            ),
            Text(
              "Let's watch a movie",
              style: TextStyle(
                fontSize: 13, 
                color: greyTextColor
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded, 
              size: 30,
              color: blackTextColor,
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded, 
              size: 30,
              color: blackTextColor,
            ),
            onPressed: () {
            },
          ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child:  
          Column(
            children: [
            const SizedBox(height: 20),
            const MovieBanner(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //biar ada dua col
                  childAspectRatio: 1, //ini jarak ke bawah
                ), 
                itemCount: 1,
                itemBuilder: (context, index) => Recommend( //buat pindah page
                        movies: movie,
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute( //buat pindah halaman, knp msih pke ini pdhl ada push? gtau, dah sepaket kali
                            builder: (context) => const MovieBanner(),
                          ),
                        ),
                      ),
              )
            )
          ],
        )
        
      )
    );
  }
}