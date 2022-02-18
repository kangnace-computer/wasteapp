// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:wasteapp/screens/forgot_password/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Forgot Password',
          textAlign:TextAlign.center,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color(0xFF757575),fontSize: 18),
        ),
      ),
      body: Body(),
    );
  }
}
