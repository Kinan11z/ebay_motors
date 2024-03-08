import 'dart:async';

import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: SizedBox(
                width: width,
                child: Image.asset(
                  login,
                  fit: BoxFit.fill,
                ),
              )),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Welcome...!',
                style: TextStyle(
                    color: MyColors().grey,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                    height: 54.0 / 45.0,
                    letterSpacing: 0.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: SizedBox(
                  width: width,
                  child: Image.asset(reverseLogin, fit: BoxFit.fill))),
        ],
      ),
    );
  }
}
