import 'package:flutter/material.dart';
import 'package:geeksynergy/screens/company_info_page.dart';
import 'package:geeksynergy/screens/home_page.dart';
import 'package:geeksynergy/screens/login_page.dart';
import 'package:geeksynergy/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/company_info': (context) => CompanyInfoPage(),
      },
    );
  }
}


