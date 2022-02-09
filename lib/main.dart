import 'package:ecommerce/screen/cart.dart';
import 'package:ecommerce/screen/detail.dart';
import 'package:ecommerce/screen/home.dart';
import 'package:ecommerce/screen/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(Ecommerce());
}

class Ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      home: LoginPage(),
      //getPages: [],
    );
  }
}
