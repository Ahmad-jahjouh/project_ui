import 'package:flutter/material.dart';
import 'package:superstore/models/bn_screen.dart';
import 'package:superstore/screen/main_screen/cart_screen.dart';
import 'package:superstore/screen/main_screen/home_screen.dart';
import 'package:superstore/screen/main_screen/profile_screen.dart';
import 'package:superstore/screen/main_screen/setting_screeen.dart';
import 'package:superstore/widget/myAppBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<BnScreen> _bnScreen = <BnScreen>[
    BnScreen(widget: const HomeScreen(), title: 'Home'),
    BnScreen(widget: const CartScreen(), title: 'Shopping Cart'),
    BnScreen(widget: const ProfileScreen(), title: 'Profile'),
    BnScreen(widget: const SettingScreen(), title: 'Settings'),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: _bnScreen[_selectedIndex].title),
      body: _bnScreen[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.redAccent, size: 27),
        unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 24),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
