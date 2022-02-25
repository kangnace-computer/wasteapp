// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unused_local_variable, prefer_final_fields, unused_field, unused_import, use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/forgot_password/body.dart';
import 'package:wasteapp/screens/map/map_page.dart';
import 'package:wasteapp/widgets/carousel_page.dart';
import 'package:wasteapp/widgets/model/feed_model.dart';
import 'package:wasteapp/widgets/size_config.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageViewController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currnt = 0;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      //           ),
      //           PopupMenuItem<int>(
      //             onTap: () async {
      //               await Firebase.initializeApp().then((value) async {
      //                 await FirebaseAuth.instance.signOut().then((value) =>
      //                     Navigator.pushNamedAndRemoveUntil(
      //                         context, '/bottom_navigation', (route) => false));
      body: ListView(
        children: [
          SizedBox(height: 10),
          bulidAppbar(),
          SizedBox(height: 20),
          CarouselPage(),
          SizedBox(height: 20),
          // buildCard(context),
          // SizedBox(height: 5),
          // buildCard(context)
        ],
      ),
    );
  }

  Container buildCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      // padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x411D2429),
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/seed/549/600',
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'วงษ์พาณิชย์รับซื้อของเก่า',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                        child: AutoSizeText(
                          'ตำบล หลักหก อำเภอเมืองปทุมธานี ปทุมธานี 12000 \n0865566424',
                          style: TextStyle(color: kTextColor, fontSize: 10),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF57636C),
                    size: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                  child: Icon(
                    Icons.assistant_direction,
                    size: 30,
                  ),
                  // child: Text(
                  //   '\$11.00',
                  //   textAlign: TextAlign.end,
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding bulidAppbar() {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            width: w * 0.8,
            height: 48.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.shade900,
                  spreadRadius: -10.0,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                child: ElevatedButton(
                  onPressed: () {
                    print('logout page');
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/bottom_navigation', (route) => false);
                  },
                  child: Icon(Icons.notifications),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade900,
                      spreadRadius: -10.0,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
