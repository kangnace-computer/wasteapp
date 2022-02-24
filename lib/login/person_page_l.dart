// ignore_for_file: use_key_in_widget_constructors, await_only_futures, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/login/charts.dart';

class PersonPageL extends StatefulWidget {
  @override
  _PersonPageLState createState() => _PersonPageLState();
}

class _PersonPageLState extends State<PersonPageL> {
  final buildauth = FirebaseAuth.instance;
  // final double coverHeight = 280;
  // final double profileHeight = 144;
  late String email, name;

  @override
  void initState() {
    super.initState();
    findNameAnEmail();
  }

  Future<void> findNameAnEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event!.displayName!;
          email = event.email!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          email,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black26,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.edit, color: Colors.green),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Edit Profile',
                              style: TextStyle(color: kTextColor)),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    onTap: () async {
                      await Firebase.initializeApp().then((value) async {
                        await FirebaseAuth.instance.signOut().then((value) =>
                            Navigator.pushNamedAndRemoveUntil(context,
                                '/bottom_navigation', (route) => false));
                      });
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.exit_to_app, color: Colors.green),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Logout',
                              style: TextStyle(color: kTextColor)),
                        )
                      ],
                    ),
                  ),
                ];
              })
        ],
        // backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          children: const [
            Charts(),
          ],
        ),
      ),
    );
  }
}
