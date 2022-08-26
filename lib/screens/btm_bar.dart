import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firstmotors/provider/dark_theme_provider.dart';
import 'package:firstmotors/screens/categories.dart';
import 'package:firstmotors/screens/home_screen.dart';
import 'package:firstmotors/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 1;
  final List _pages = [
    const CategoriesScreen(),
    const HomeScreen(),
    const LocationScreen()
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: themeState.getDarkTheme ? Colors.black : Colors.white,
        color: themeState.getDarkTheme ? Colors.white : Colors.black,
        items: const <Widget>[
          Icon(Icons.category, size: 30, color: Colors.red),
          Icon(Icons.directions_car, size: 30, color: Colors.red),
          Icon(Icons.pin_drop, size: 30, color: Colors.red),
        ],
        onTap: _selectedPage,
        height: 60,
      ),
      //body: Container(color: Colors.white),
    );
  }
}
