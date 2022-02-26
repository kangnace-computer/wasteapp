// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/login/charts.dart';
import 'package:wasteapp/login/person_page_l.dart';
import 'package:wasteapp/screens/feed/feed_page.dart';
import 'package:wasteapp/screens/home/home_page.dart';
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
        backgroundColor: Color(0xFFC0eDD0),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryLightColor,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.compass),
            label: 'Shop',
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
