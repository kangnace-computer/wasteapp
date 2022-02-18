import 'package:flutter/material.dart';
import 'package:wasteapp/screens/feed_page.dart';
import 'package:wasteapp/screens/home_page.dart';
import 'package:wasteapp/screens/person_page.dart';
import 'package:wasteapp/screens/splash/onbording.dart';
import 'package:wasteapp/login/person_page_l.dart';
import 'package:wasteapp/widgets/bottom_navigation.dart';
import 'package:wasteapp/widgets/bottom_login.dart';

final Map<String, WidgetBuilder> routers = {
  '/onbording':(BuildContext context) => Onbording(),
  '/home_Page':(BuildContext context) => HomePage(),
  '/bottom_login':(BuildContext context) => bottomlogin(),
  '/person_page' :(BuildContext context) => PersonPage(),
  '/person_page_l' :(BuildContext context) => PersonPageL(),
  '/bottom_navigation':(BuildContext context) => BottomNavigation(),
  '/feed_page':(BuildContext context) => FeedPage(),
};