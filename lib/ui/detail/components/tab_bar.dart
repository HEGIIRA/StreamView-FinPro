import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  TabBarWidget({super.key, 
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final List<String> tabs = ["Episodes", "Suggested", "About"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTabSelected(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      tabs[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: selectedIndex == index ? 18 : 14,
                        color: selectedIndex == index
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      height: 2,
                      width: 30,
                      color: selectedIndex == index
                          ? Colors.purple
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
