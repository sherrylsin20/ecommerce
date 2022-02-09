import 'package:ecommerce/screen/register.dart';
import 'package:ecommerce/service/apiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  APIServices _api = APIServices();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: Get.size.height,
        width: Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            const Text(
              'Login', style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            SizedBox(height: Get.size.height * 0.05,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Email', style: TextStyle(fontSize: 16, color: Colors.black),
            ),),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: Get.size.height * 0.05,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Password', style: TextStyle(fontSize: 16, color: Colors.black),
            ),),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            SizedBox(height: Get.size.height * 0.05,),
            TextButton(
              onPressed: (){
                _api.auth(_emailController.text, _passwordController.text);
                
              }, 
              child: const Text(
                'Login', 
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
            const Spacer(),
            TextButton(
              onPressed: (){
                Get.to(()=>RegisterPage());
              }, 
              child: const Text('Belum punya akun? Daftar')),
          ],
        ),
      ),
    ));
  }
}