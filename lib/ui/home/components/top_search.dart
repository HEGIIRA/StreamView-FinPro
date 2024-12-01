import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';

// TopSearch adalah widget untuk menampilkan daftar episode populer.
class TopSearch extends StatefulWidget {
  const TopSearch({super.key});

  @override
  State<TopSearch> createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  final List<Map<String, String>> episodes = [
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
        // Gunakan Expanded jika ini bagian dari layout utama

        SizedBox(
          height: 300, // Atur tinggi jika ini bagian kecil dari layar
          child: _buildEpisodeList(),
        ),
      ],
    );
  }

  Widget _buildEpisodeList() {
    return ListView.builder(
      scrollDirection: Axis.vertical, // Scroll secara vertikal
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  episode["image"]!,
                  width: 150,
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
                icon: const Icon(Icons.emoji_events),
                color: Colors.orange,
                onPressed: () {
                  // Tambahkan aksi di sini (contoh: navigasi atau log)
                  debugPrint("Icon pressed for ${episode['title']}");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
