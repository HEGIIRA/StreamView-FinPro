import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/detail_img/detail_cover.png", // Gambar latar belakang
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        const Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "JOY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "2021 | 4 Season | 34 Episodes | Family, Drama",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                "The film opens with Phineas Taylor 'P.T.' Barnum (Hugh Jackman) joining his circus troupe in a song",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
