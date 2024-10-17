import 'package:avoota/routes/app_page.dart';
import 'package:avoota/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'constants/color_constant.dart';
import 'constants/image_constant.dart';

void main() {
  runApp(const AvootaApp());
}

class AvootaApp extends StatelessWidget {
  const AvootaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        color: cPrimeryColor2,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff5A74FD),
          ),
          primarySwatch: Colors.blue,
          applyElevationOverlayColor: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.initial,
        getPages: AppPages.routes,
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.bgImagePng),
                  fit: BoxFit.cover)),
        ),
      );
    });
  }
}
