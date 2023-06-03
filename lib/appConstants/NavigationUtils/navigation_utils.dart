import 'package:flutter/material.dart';
import 'package:flutter_supabase/screens/Bottombar/bottombar.dart';
import 'package:flutter_supabase/screens/OnBoarding/onboarding.dart';
import 'package:flutter_supabase/screens/authentication/forget_password.dart';
import 'package:flutter_supabase/screens/authentication/login_screen.dart';
import 'package:flutter_supabase/screens/authentication/signup_screen.dart';
import 'package:get/get.dart';

class NavigationUtils {
  //Navigate to previous Screen
  openPreviousScreen() {
    Navigator.pop(Get.context!);
  }

  //Navigate to the desired screen
  openBoardingScreen() {
    Navigator.pushAndRemoveUntil(
      Get.context!,
      MaterialPageRoute(builder: (context) => const OnBoarding()),
      (route) => false,
    );
  }

  openLoginScreen() {
    Navigator.pushAndRemoveUntil(
      Get.context!,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  openSignUpScreen() {
    Navigator.push(Get.context!,
        MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  openForgetPasswordScreen() {
    Navigator.push(Get.context!,
        MaterialPageRoute(builder: (context) => const ForgetPassword()));
  }

  openDashBoardScreen() {
    Navigator.push(Get.context!,
        MaterialPageRoute(builder: (context) => const BottomBar()));
  }
}
