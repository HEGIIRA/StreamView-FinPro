import 'package:flutter/material.dart';

class EpisodeListWidget extends StatelessWidget {
  final List<Map<String, String>> episodes = [
    {
      "image": "assets/images/detail_img/episode_1.png",
      "title": "The Vanishing of Will Byers",
      "duration": "49 minutes",
      "description":
          "On his way home from a friend's house, young Will sees something terrifying. Nearby, a sinister secret lurks in the depths of a government lab.",
    },
    {
      "image": "assets/images/detail_img/episode_2.png",
      "title": "The Weirdo on Maple Street",
      "duration": "56 minutes",
      "description":
          "Lucas, Mike, and Dustin try to talk to the girl they found in the woods. Hopper questions an anxious Joyce about an unsettling phone call.",
    },
  ];

  EpisodeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  width: 100,
                  height: 80,
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
                      episode["duration"]!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      episode["description"]!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.emoji_events),
                color: Colors.orange,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
