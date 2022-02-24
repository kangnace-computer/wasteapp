// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, must_be_immutable, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/screens/forgot_password/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  FirebaseAuth firebaseAuthen = FirebaseAuth.instance;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xB607A01C),
        elevation: 1,
        title: Text('Forgot Password'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 60, bottom: 16, left: 8, right: 8),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: "E-mail",
                  // hintText: 'Fill e-mail registered before',
                  icon: Icon(Icons.email)),
            ),
          ),
          Container(
            height: h * 0.08,
            width: w * 0.6,
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: -10.0,
                  offset: Offset(0.0, 10.0),
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                fnSendPasswordLinkViaEmail(email: emailController.text);
              },
              child: Text(
                'Send Password',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xB607A01C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  fnSendPasswordLinkViaEmail({required String email}) {
    firebaseAuthen.sendPasswordResetEmail(email: email).then(
      (value) {
        SnackBar(
            content: Text('Sent already to $email'),
            backgroundColor: Colors.green);
      },
    ).catchError(
      (error) {
        scaffoldKey.currentState!.showSnackBar(SnackBar(
            content: Text('Error to send link to $email'),
            backgroundColor: Colors.red));
      },
    ).whenComplete(
      () {
        scaffoldKey.currentState!.showSnackBar(SnackBar(
            content: Text('When completed'), backgroundColor: Colors.green));
      },
    );
  }
}
    //   appBar: AppBar(
    //     // ignore: prefer_const_constructors
    //     title: Text(
    //       'Forgot Password',
    //       textAlign:TextAlign.center,
    //       // ignore: prefer_const_constructors
    //       style: TextStyle(color: Color(0xFF757575),fontSize: 18),
    //     ),
    //   ),
    //   body: Body(),
    // );