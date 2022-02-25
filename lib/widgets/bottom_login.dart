// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wasteapp/login/charts.dart';
import 'package:wasteapp/login/person_page_l.dart';
import 'package:wasteapp/screens/feed_page.dart';
import 'package:wasteapp/screens/home_page.dart';
import 'package:wasteapp/screens/map/map_page.dart';

class bottomlogin extends StatefulWidget {
  @override
  _bottomloginState createState() => _bottomloginState();
}

class _bottomloginState extends State<bottomlogin> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    MapPage(),
    FeedPage(),
    PersonPageL(),
    // Charts(),
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.green.shade400,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Persons',
          ),
        ],
      ),
    );
  }
}
