import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/Widgets/textfield.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:flutter_supabase/screens/Bottombar/bottombar.dart';
import 'package:flutter_supabase/screens/authentication/forget_password.dart';
import 'package:flutter_supabase/screens/authentication/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CustomDesign customDesign = CustomDesign();

  //Declaring Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: ColorConstants.lightWhite,
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.padding15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.25,
              ),
              Text(
                StringConstant.welcomeback,
                style: customDesign.welcomeBack,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                StringConstant.email,
                style: customDesign.despText,
              ),
              customDesign.sizedBox10,
              SmartLearnTextField(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Your Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: ColorConstants.primaryColor,
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                StringConstant.password,
                style: customDesign.despText,
              ),
              customDesign.sizedBox10,
              SmartLearnTextField(
                  controller: passwordController,
                  textInputType: TextInputType.text,
                  hintText: 'Your Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline_sharp,
                    color: ColorConstants.primaryColor,
                  )),
              customDesign.sizedBox20,
              Align(
                alignment: Alignment.centerRight,
                child: Bounce(
                  onPressed: navigateToForgotpassword,
                  duration: const Duration(milliseconds: 110),
                  child: Text(
                    StringConstant.forgotPassword,
                    style: customDesign.forgotPassword,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Button(
                  buttonTitle: StringConstant.login,
                  onClick: navigateToDashboard,
                  color: ColorConstants.primaryDark,
                  textStyle: customDesign.getStarted),
              customDesign.sizedBox20,
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstant.orLoginVia,
                    style: customDesign.orLoginVia,
                  )),
              customDesign.sizedBox20,
              Bounce(
                duration: const Duration(milliseconds: 110),
                onPressed: () {},
                child: Container(
                  width: width,
                  height: SizeConstant.buttonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorConstants.lightBackground,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AssetsPath.googleSvg),
                          Text(
                            StringConstant.loginWithGoogle,
                            style: customDesign.loginWithGoogle,
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConstant.createAnAccount,
                    style: customDesign.createanaccount,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 110),
                    onPressed: navigateToSignupScreen,
                    child: Text(
                      StringConstant.here,
                      style: customDesign.here,
                    ),
                  )
                ],
              ),
              customDesign.sizedBox20
            ],
          ),
        ),
      ),
    );
  }

  navigateToForgotpassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgetPassword()));
  }

  navigateToSignupScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  navigateToDashboard() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const BottomBar()));
  }
}
