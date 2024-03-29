import 'dart:async';

import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Image.asset('assets/img/mirror_splash.png'),
        ),
      ),
    );
  }
}
