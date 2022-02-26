// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, deprecated_member_use, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/home/home_page.dart';
import 'package:wasteapp/screens/person_page.dart';
import 'package:wasteapp/widgets/dialog.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormFieldState>();
  bool isHiddenPassword = true;
  late String name, email, password;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wallpaper.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Column(
              //   children: [
              //     SizedBox(
              //       height: h * 0.15,
              //     ),
              //     CircleAvatar(
              //       radius: h / 14,
              //       backgroundImage:
              //           const AssetImage('assets/images/getstudentimage.jpg'),
              //     ),
              //   ],
              // ),
            ),
            Container(
              key: formKey,
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  bulidName(), //รับชื่อผู้ใช้งาน
                  SizedBox(height: 15),
                  bulidEmail(), //รับข้อมูลอีมเล ของผู้ใช้
                  SizedBox(height: 15),
                  bulidPassword(), //รับข้อมูลรหัสผ่าน ของผู้ใช้
                ],
              ),
            ),
            bulidRegister(h, w),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PersonPage();
                        },
                      ),
                    );
                  },
                text: "Have an account?",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text: "Sign Up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'version 1.0.0 power by manhattan',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bulidRegister(double h, double w) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: h * 0.08,
      width: w * 0.5,
      child: FlatButton(
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          print('name = $name, email = $email, password = $password');
          if ((name.isEmpty) || (email.isEmpty) || (password.isEmpty)) {
            // print('Have Space');
            normalDialog(context, 'มีช่องว่าง ? กรุณากรอกข้อมูล');
          } else {
            // print('No Space');
            registerFirebase();
          }
        },
        color: Colors.white,
        textColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900,
            blurRadius: 10,
            spreadRadius: -10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
    );
  }

  Container bulidName() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900,
            blurRadius: 10,
            spreadRadius: -10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      child: TextField(
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          hintText: 'Name',
          prefixIcon: Icon(Icons.person),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.green, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Container bulidEmail() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900,
            blurRadius: 10,
            spreadRadius: -10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email = value.trim(),
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.green, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Container bulidPassword() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900,
            blurRadius: 10,
            spreadRadius: -10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.security),
          suffixIcon: IconButton(
              icon: isHiddenPassword
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isHiddenPassword = !isHiddenPassword;
                });
              }),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.green, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Future<void> registerFirebase() async {
    await Firebase.initializeApp().then(
      (value) async {
        print("############ Firebase OK ###############");
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          normalDialog(context, 'Register Success');
          print("Register Success");
          await value.user!.updateProfile(displayName: name).then((value) =>
              Navigator.restorablePushNamedAndRemoveUntil(
                  context, '/bottom_login', (route) => false));
        }).catchError((value) {
          normalDialog(context, value.message);
        });
      },
    );
  }
}
