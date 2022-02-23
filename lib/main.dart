import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/router.dart';

String initialRoute = '/onbording';

// ignore: prefer_void_to_null
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        // initialRoute = '/bottom_login';
        initialRoute = '/bottom_login';
      }
      runApp(const MyApp());
    });
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'This Wast App',
      theme: theme(),
      routes: routers,
      initialRoute: initialRoute,
    );
  }
}
