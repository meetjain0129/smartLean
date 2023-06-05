import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_supabase/appConstants/NavigationUtils/navigation_utils.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      NavigationUtils().openBoardingScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            color: ColorConstants.lightBackground,
            width: width,
            height: height,
            child: Center(
                child: Image.asset(
              AssetsPath.smartLearnLogo,
              width: width * 0.7,
              height: height * 0.2,
            ))));
  }
}
