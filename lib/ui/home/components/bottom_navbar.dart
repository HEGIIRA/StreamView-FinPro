import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(IconsaxPlusLinear.home_2),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconsaxPlusLinear.search_normal_1),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconsaxPlusLinear.receive_square),
          label: 'Download',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconsaxPlusLinear.user),
          label: 'Profile',
        ),
      ],
    );
  }
}
