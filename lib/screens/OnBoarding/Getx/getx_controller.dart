import 'package:flutter/material.dart';
import 'package:flutter_supabase/Data/onboarding_data.dart';
import 'package:get/get.dart';

class GetxControllerClass extends GetxController {
  OnBoardingData onBoardingData = OnBoardingData();
  RxInt currentIndex = 0.obs;
  PageController controller = PageController();

  changePage() {
    if (currentIndex != onBoardingData.datalist.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0.obs;
    }
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
