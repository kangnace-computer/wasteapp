// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unused_local_variable, prefer_final_fields, unused_field, unused_import, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/forgot_password/body.dart';
import 'package:wasteapp/widgets/carousel_page.dart';
import 'package:wasteapp/widgets/model/feed_model.dart';
import 'package:wasteapp/widgets/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currnt = 0;
  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
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
          bulidListView()
        ],
      ),
    );
  }

  ListView bulidListView() {
    return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            bulidCard(),
            bulidCard(),
            bulidCard(),
            bulidCard(),
            bulidCard(),
            bulidCard(),
            bulidCard(),
            bulidCard(),
          ],
        );
  }

  Card bulidCard() {
    return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFF5F5F5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/876/600',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Hello World',
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
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

  bulidlisview() {
    Container(
      color: Colors.red,
    );
  }
}
