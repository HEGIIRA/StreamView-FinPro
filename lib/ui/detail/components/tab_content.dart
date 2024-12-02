import 'package:flutter/material.dart';
import 'episode_list.dart'; // Import daftar episode

class TabContentWidget extends StatelessWidget {
  final int selectedIndex;

  TabContentWidget({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 0) {
      return EpisodeListWidget(); // Jika tab Episodes dipilih, tampilkan daftar episode
    } else {
      return Center(
        child: Text(
          selectedIndex == 1 ? "Suggested Content" : "About Content",
        ),
      );
    }
  }
}
