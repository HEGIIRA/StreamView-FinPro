import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';

class OnBoardingScreen extends StatefulWidget {
 const OnBoardingScreen({super.key});

 @override
 State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 int currentPage = 0; // Menyimpan halaman yang sedang aktif
 PageController _pageController = PageController(); // Controller untuk mengelola PageView


 // Data OnBoardingScreen yang akan ditampilkan
 List<Map<String, String>> splashData = [
   {
     "text": "Watching can be from anywhere", 
     "subText": "Enjoy your favorite movies anytime and anywhere. Whether you're at home, traveling, or relaxing outdoors, entertainment is just a click away.",
     "image": "assets/images/onBoarding_img/onBoarding_1.png",
   },
   {
     "text": "Complete list of movies", 
     "subText": "Discover a vast collection of movies across all genres. From timeless classics to the latest blockbusters, there's something for everyone to enjoy.",
     "image": "assets/images/onBoarding_img/onBoarding_2.png", 
   },
   {
     "text": "Spent Time with Loved Ones!", 
     "subText": "Create unforgettable memories with your loved ones through movies. Laugh, cry, and bond together with every story.", 
     "image": "assets/images/onBoarding_img/onBoarding_3.png", 
   },
 ];


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
           // Bagian gambar dan teks dalam PageView
           Expanded(
             child: PageView.builder(
               controller: _pageController, // Menggunakan PageController untuk mengatur halaman
               onPageChanged: (value) {
                 setState(() {
                   currentPage = value; // value = halam yg aktif
                 });
               },
               itemCount: splashData.length, // Jumlah halaman yang ada
               itemBuilder: (context, index) => SplashContent(
                 text: splashData[index]["text"]!, // Menampilkan teks utama
                 subText: splashData[index]["subText"]!, // Menampilkan subteks
                 image: splashData[index]["image"]!, // Menampilkan gambar
               ),
             ),
           ),


           // Indikator halaman (dots) di bawah
           Row(
             mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi dots di tengah
             children: List.generate(
               splashData.length, // Menghasilkan indikator sesuai jumlah data splash
               (index) => _dotIndicator(index: index), // Membuat dot untuk setiap halaman
             ),
           ),

           // Tombol "Next" atau "Start"
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
             child: SizedBox(
               width: double.infinity, // Membuat tombol selebar layar
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: primaryColor, // Warna tombol
                   padding: const EdgeInsets.all(16),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30), // Membuat sudut tombol melengkung
                   ),
                 ),
                 onPressed: () {
                   if (currentPage == splashData.length - 1) {
                     // Jika halaman terakhir, pindah ke halaman homeScreen
                     Navigator.pushNamed(context, "/home");
                   } else {
                     // Jika bukan halaman terakhir, geser ke halaman berikutnya
                     _pageController.animateToPage(
                       currentPage + 1,
                       duration: animationDuration,
                       curve: Curves.easeIn, // Animasi smooth saat berpindah
                     );
                   }
                 },
                 child: Text(
                   currentPage == splashData.length - 1 ? "Start" : "Next", // Teks pada tombol
                   style: const TextStyle(color: Colors.white),
                 ),
               ),
             ),
           ),
         ],
       ),
     ),
   );
 }


 // Fungsi untuk membuat indikator dot
 AnimatedContainer _dotIndicator({required int index}) {
   return AnimatedContainer(
     duration: animationDuration, // Durasi animasi
     curve: Curves.easeInOut, // Animasi yang smooth
     margin: const EdgeInsets.only(right: 10), // Margin antar dot
     width: currentPage == index ? 20 : 10, // Ukuran dot yang aktif lebih besar
     height: 10,
     decoration: BoxDecoration(
       color: currentPage == index ? primaryColor : greyTextColor, // Warna dot aktif atau tidak aktif
       borderRadius: BorderRadius.circular(5),
     ),
   );
 }
}


class SplashContent extends StatelessWidget {
 final String text;
 final String subText;
 final String image;


 const SplashContent({
   super.key,
   required this.text,
   required this.subText,
   required this.image,
 });


 @override
 Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 20.0),
     child: Column(
       children: [
         const SizedBox(height: 20),
         ClipRRect(
           borderRadius: BorderRadius.circular(16), // Sudut gambar yang melengkung
           child: Image.asset(
             image,
             height: MediaQuery.of(context).size.height * 0.6, // Tinggi gambar lebih panjang (60%)
             width: MediaQuery.of(context).size.width * 0.8, // Lebar gambar lebih kecil (80%)
             fit: BoxFit.cover, // Menyesuaikan gambar agar sesuai
           ),
         ),
         const SizedBox(height: 20),
         Text(
           text,
           textAlign: TextAlign.center, // Meratakan teks di tengah
           style: const TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.bold,
             color: Colors.black87,
           ),
         ),
         const SizedBox(height: 8),
         Text(
           subText,
           textAlign: TextAlign.center,
           style: const TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w400,
             color: Colors.grey,
           ),
         ),
       ],
     ),
   );
 }
}



