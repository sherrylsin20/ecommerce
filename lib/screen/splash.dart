import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF6597AF),
        body: Center(
          child: Text(
                'E-Commerce',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 32,
                  color: Colors.white,
                  letterSpacing: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    GetStorage box = GetStorage();

    bool _isLogged = box.read('logged') ?? false;

    if (!_isLogged) {
      box.write('logged', true);
      Get.offAllNamed('login');
    } else {
      Get.offAllNamed('home');
    }
  }
}
