import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  var qty = 1.obs;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Item name',
                style: TextStyle(fontSize: 24),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                onPressed: () {
                  setState(() {
                    if(qty > 1) {
                      qty--;
                    }
                  });
                },
                icon: Icon(Icons.remove),
                iconSize: 24,
              ),
                  Obx(
                    () => Text(qty.string),
                  ),
                  IconButton(
                onPressed: () {
                  setState(() {
                    qty++;
                  });
                },
                icon: Icon(Icons.add),
                iconSize: 24,
              ),
                ],
              ),
              TextButton(
              onPressed: (){}, 
              child: const Text(
                'Add to cart', 
                style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.blue)
                    )
                  ),
                )
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}
