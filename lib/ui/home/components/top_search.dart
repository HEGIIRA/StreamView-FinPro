import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:stream_view/consts.dart';

// TopSearch adalah widget untuk menampilkan daftar episode populer.
class TopSearch extends StatefulWidget {
  const TopSearch({super.key});

  @override
  State<TopSearch> createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  final List<Map<String, String>> movieList = [
    {
      "image": "assets/images/list_img/list_img1.png",
      "title": "Bridgerton",
      "genre": "Romance, Drama",
    },
    {
      "image": "assets/images/list_img/list_img2.png",
      "title": "Avatar",
      "genre": "Sci-Fi, Action",
    },
    {
      "image": "assets/images/list_img/list_img3.png",
      "title": "1917",
      "genre": "Action, Drama",
    },
    {
      "image": "assets/images/list_img/list_img4.png",
      "title": "Brave",
      "genre": "Adventure"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Top Searches",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: blackTextColor,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        _buildMovieList(),
      ],
    );
  }

  Widget _buildMovieList() {
    // Ganti ListView dengan Column untuk menampilkan item tanpa scroll
    return Column(
      children: movieList.map((episode) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  episode["image"]!,
                  width: 155,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode["title"]!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      episode["genre"]!, 
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(
                  IconsaxPlusLinear.video_circle,
                  size: 30,
                ),
                color: blackTextColor,
                onPressed: () {},
              ),
            ],
          ),
        );
      }).toList(), // Menggunakan map untuk mengubah list menjadi widgets Column
    );
  }
}
