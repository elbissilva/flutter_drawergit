import 'package:flutter/material.dart';
import 'package:flutter_drawergit/pages/login_page.dart';
import 'package:flutter_drawergit/pages/page_finished.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
