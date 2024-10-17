import 'dart:async';
import 'package:avoota/constants/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color_constant.dart';
import '../../routes/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBgColor,
        body: Center(
          child: Container(
              color: cBgColor,
              child: Image.asset(
                ImageConstants.logoPng,
                scale: 3.9,
              )),
        ));
  }

  void initState() {
    getValidation();
    super.initState();
  }

  getValidation() async {
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.loginScreen);
    });
  }
}
