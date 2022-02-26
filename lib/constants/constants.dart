import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF397d54);
const kPrimaryLightColor = Color(0xFF73c088);

const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF235d3a), Color(0xFFc8ead1)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFFF2F3F7),
  );
}