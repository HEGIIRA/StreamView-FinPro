import 'dart:async'; // Untuk menggunakan Timer
import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart'; // Import paket Flutter

class MovieBanner extends StatefulWidget {
  const MovieBanner({super.key}); // Konstruktor default

  @override
  // ignore: library_private_types_in_public_api
  _MovieBannerState createState() => _MovieBannerState(); // Membuat State untuk widget ini
}

class _MovieBannerState extends State<MovieBanner> {
  // Controller untuk PageView agar kita bisa mengontrol pergeseran halaman
  final PageController _pageController = PageController();

  // Index halaman saat ini
  int _currentPage = 0;

  // Timer untuk membuat slider berjalan otomatis
  late Timer _timer;

  // Daftar gambar untuk banner
  final List<String> _bannerImages = [
    "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png",
  ];

  @override
  void initState() {
    super.initState();

    // Membuat Timer untuk mengganti halaman setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      // Jika halaman saat ini bukan yang terakhir
      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++; // Pindah ke halaman berikutnya
      } else {
        _currentPage = 0; // Kembali ke halaman pertama jika sudah di akhir
      }

      // Menggerakkan PageView ke halaman yang sesuai
      _pageController.animateToPage(
        _currentPage, // Pindah ke halaman yang sesuai
        duration: const Duration(milliseconds: 400), // Durasi transisi
        curve: Curves.easeInOut, // Efek transisi yang halus
      );
    });

    // Listener untuk melacak perubahan halaman
    _pageController.addListener(() {
      // Mendapatkan index halaman dari PageController
      int page = _pageController.page?.round() ?? 0;

      // Jika index halaman berubah, perbarui state
      if (_currentPage != page) {
        setState(() {
          _currentPage = page; // Simpan halaman baru
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer ketika widget dihapus
    _pageController.dispose(); // Bersihkan controller untuk mencegah kebocoran memori
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container pembungkus untuk memberikan border dan sudut melengkung
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16), // Memberikan margin luar
          decoration: BoxDecoration(
            color: Colors.white, // Warna latar belakang container
            borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung pada container luar
            boxShadow: [
              // Menambahkan bayangan agar terlihat menarik
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Warna bayangan
                blurRadius: 10, // Tingkat blur bayangan
                offset: const Offset(0, 5), // Posisi bayangan
              ),
            ],
          ),
          // Tidak ada padding di sini, agar gambar bisa mengisi seluruh ruang
          child: ClipRRect(
            // Untuk memastikan sudut melengkung tetap terjaga di dalam Container
            borderRadius: BorderRadius.circular(20), 
            child: SizedBox(
              height: 220, // Tinggi area banner
              child: PageView.builder(
                controller: _pageController, // Controller untuk mengontrol PageView
                itemCount: _bannerImages.length, // Jumlah item di slider
                itemBuilder: (context, index) {
                  // Membuat widget untuk setiap halaman
                  return Image.asset(
                    _bannerImages[index], // Gambar dari aset
                    fit: BoxFit.cover, // Gambar akan mengisi seluruh ruang dan dipotong jika perlu
                  );
                },
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Indikator titik (dots) di bawah banner
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Posisikan titik di tengah
          children: List.generate(_bannerImages.length, (index) {
            // Membuat titik untuk setiap halaman
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Animasi saat titik berubah
              margin: const EdgeInsets.symmetric(horizontal: 5), // Spasi antar titik
              height: 10, // Tinggi titik
              width: _currentPage == index ? 25 : 10,
              decoration: BoxDecoration(
                //ini kayak, halaman ini ktif ga?
                color: _currentPage == index ? primaryColor : Colors.grey,
                borderRadius: BorderRadius.circular(5)
                // shape: BoxShape.circle, // Membuat titik berbentuk lingkaran
              ),
            );
          }),
        ),
      ],
    );
  }
}
