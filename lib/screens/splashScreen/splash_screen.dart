import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/screens/OnBoarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                    position: animation.drive(tween), child: child);
              },
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const OnBoarding()),
          (route) => false);
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
