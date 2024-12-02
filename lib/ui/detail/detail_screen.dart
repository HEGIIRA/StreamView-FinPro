import 'package:flutter/material.dart';
import 'package:stream_view/ui/detail/components/action_buttons.dart';
import 'package:stream_view/ui/detail/components/header.dart';
import 'package:stream_view/ui/detail/components/tab_bar.dart';
import 'package:stream_view/ui/detail/components/tab_content.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Aksi tombol kembali
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(), // Panggil widget header
          ActionButtons(), // Panggil widget action buttons
          TabBarWidget(
            selectedIndex: selectedIndex,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index; // Update selected index saat tab berubah
              });
            },
          ),
          Expanded(
            child: TabContentWidget(selectedIndex: selectedIndex),
          ),
        ],
      ),
    );
  }
}
