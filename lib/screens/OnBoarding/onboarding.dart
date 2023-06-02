import 'package:flutter/material.dart';
import 'package:flutter_supabase/Data/onboarding_data.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:flutter_supabase/screens/authentication/login_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  CustomDesign customDesign = CustomDesign();
  OnBoardingData onBoardingData = OnBoardingData();
  PageController controller = PageController();

  //Variables Declaration
  bool isButtonsVisible = true;

  int currentIndex = 0;
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
        length: onBoardingData.datalist.length,
        initialIndex: currentIndex,
        vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Initializing MediaQuery Height and Width
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.padding15),
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            SizedBox(
              width: width,
              height: height * 0.55,
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: onBoardingData.datalist.length,
                allowImplicitScrolling: false,
                onPageChanged: (value) {
                  setState(() {
                    tabController!.index = value;
                    value == 2
                        ? isButtonsVisible = false
                        : isButtonsVisible = true;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onBoardingData.datalist[index].onboardingImage,
                        width: width * 0.8,
                        height: height * 0.2,
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Text(
                        onBoardingData.datalist[index].onboardingTitle,
                        style: customDesign.onboardingBlueText,
                        textAlign: TextAlign.center,
                      ),
                      customDesign.sizedBox10,
                      SizedBox(
                        width: width * 0.8,
                        child: Text(
                          onBoardingData.datalist[index].onboardingDesp,
                          style: customDesign.onboardingDespText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            TabPageSelector(
              controller: tabController,
            ),
            const Spacer(),
            Visibility(
              visible: isButtonsVisible,
              replacement: Button(
                  buttonTitle: 'Get Started',
                  onClick: navigate,
                  textStyle: customDesign.getStarted,
                  color: ColorConstants.primaryDark),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bounce(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child);
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const LoginScreen()),
                          (route) => false);
                    },
                    duration: const Duration(milliseconds: 110),
                    child: Text(
                      StringConstant.skip,
                      style: customDesign.skipDesign,
                    ),
                  ),
                  Bounce(
                    onPressed: () {
                      setState(() {
                        (currentIndex != onBoardingData.datalist.length - 1)
                            ? currentIndex++
                            : currentIndex = 0;
                        controller.animateToPage(controller.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      });
                    },
                    duration: const Duration(milliseconds: 110),
                    child: Row(
                      children: [
                        Text(
                          StringConstant.next,
                          style: customDesign.nextDesign,
                        ),
                        const SizedBox(
                          width: SizeConstant.width5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorConstants.darkBlue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            customDesign.sizedBox20
          ],
        ),
      ),
    );
  }

  navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
