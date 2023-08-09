import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MusicPlayer.dart';
import '../SignUp.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex=0;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;

          if (_currentIndex == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignUp()));
          }
          if (_currentIndex == 2) {

          }
          if (_currentIndex == 3) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MusicPlayer()));
          }
        });
      },
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffFEF6F6),
      selectedFontSize: 18,
      unselectedFontSize: 14,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'Recipe',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wine_bar_sharp),
          label: 'Challenges',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.electric_bolt_outlined),
          label: 'Workout',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'Profile',
        ),
      ],
    );
  }
}
