import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text("Play"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              minimumSize: const Size(120, 40),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download_for_offline),
            color: Colors.purple,
            iconSize: 28,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded),
            color: Colors.purple,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
