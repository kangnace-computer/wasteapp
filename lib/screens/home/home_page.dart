// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unused_local_variable, prefer_final_fields, unused_field, unused_import, use_key_in_widget_constructors, non_constant_identifier_names, await_only_futures

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/forgot_password/body.dart';
import 'package:wasteapp/screens/map/map_page.dart';
import 'package:wasteapp/widgets/carousel_page.dart';
import 'package:wasteapp/screens/feed/feed_model.dart';
import 'package:wasteapp/widgets/model/shop_model.dart';
import 'package:wasteapp/widgets/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselPage(),
        ],
      ),
    );
  }
}
