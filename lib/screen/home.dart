import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: Get.size.height,
        width: Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Items',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Spacer(),
            itemGrid(),
          ],
        ),
      ),
    ));
  }

  Widget itemGrid() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: Get.height * 0.8,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: List.generate(10, (index) {
              return InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Item $index',
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
