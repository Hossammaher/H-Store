import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:h_store/Screens/HomeScreen.dart';
import 'package:h_store/Screens/DetailsScreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Function(List<Widget>) onScreensChanged;
  const BottomNavigationWidget({
    super.key, required this.onScreensChanged,
  });


  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}


class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  // Initially selected index

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return
      GNav(
        haptic: true,
        selectedIndex: _selectedIndex,
        gap: 8,
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs:  [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite_border,
            text: 'Favorite',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
        ]);
  }
}
