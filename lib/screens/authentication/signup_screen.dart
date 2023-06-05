import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/Widgets/textfield.dart';
import 'package:flutter_supabase/appConstants/NavigationUtils/navigation_utils.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CustomDesign customDesign = CustomDesign();
  bool isMaleSelected = true, isFemaleSelected = false;

  //Initializing the controller
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              IconButton(
                  splashRadius: SizeConstant.splashRadius,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    NavigationUtils().openPreviousScreen();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  Container(
                    width: SizeConstant.width5,
                    height: SizeConstant.buttonHeight,
                    color: ColorConstants.yellow,
                  ),
                  customDesign.sizedBoxw10,
                  Text(
                    StringConstant.createAccount,
                    style: customDesign.resetPassword,
                  ),
                ],
              ),
              customDesign.sizedBox20,
              Text(
                StringConstant.createAccountdesp,
                style: customDesign.loginWithGoogle,
              ),
              customDesign.sizedBox25,
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
                height: height * 0.03,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstant.orSignupVia,
                    style: customDesign.orLoginVia,
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              SmartLearnTextField(
                  hintText: 'Full Name',
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                    color: ColorConstants.primaryColor,
                  ),
                  textInputType: TextInputType.name,
                  controller: fullNameController),
              customDesign.sizedBox20,
              SmartLearnTextField(
                  hintText: 'Your Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: ColorConstants.primaryColor,
                  ),
                  textInputType: TextInputType.emailAddress,
                  controller: fullNameController),
              customDesign.sizedBox20,
              SmartLearnTextField(
                  hintText: 'Your Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: ColorConstants.primaryColor,
                  ),
                  textInputType: TextInputType.visiblePassword,
                  controller: fullNameController),
              customDesign.sizedBox20,
              SmartLearnTextField(
                  hintText: 'Mobile Number',
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: ColorConstants.primaryColor,
                  ),
                  textInputType: TextInputType.phone,
                  controller: fullNameController),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Bounce(
                    duration: const Duration(milliseconds: 110),
                    onPressed: changeGender,
                    child: Container(
                      width: width * 0.35,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeConstant.padding10),
                      decoration: BoxDecoration(
                          color: isMaleSelected
                              ? ColorConstants.primaryDark
                              : ColorConstants.lightWhite,
                          border: Border.all(
                              color: !isMaleSelected
                                  ? ColorConstants.primaryDark
                                  : ColorConstants.primaryDark),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: isMaleSelected
                                ? ColorConstants.lightBackground
                                : ColorConstants.primaryDark,
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            "Male",
                            style: CustomDesign().getStarted,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 110),
                    onPressed: changeGender,
                    child: Container(
                      width: width * 0.35,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeConstant.padding10),
                      decoration: BoxDecoration(
                          color: isFemaleSelected == true
                              ? ColorConstants.primaryDark
                              : ColorConstants.lightWhite,
                          border: Border.all(
                              color: !isFemaleSelected
                                  ? ColorConstants.primaryDark
                                  : ColorConstants.primaryDark),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.female),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Female',
                            style: isFemaleSelected
                                ? CustomDesign().getStarted
                                : CustomDesign().textNormalPrimaryDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Button(
                  buttonTitle: StringConstant.signup,
                  onClick: () {
                    NavigationUtils().openDashBoardScreen();
                  },
                  color: ColorConstants.primaryDark,
                  textStyle: customDesign.getStarted)
            ],
          ),
        ),
      ),
    );
  }

  changeGender() {
    if (isMaleSelected) {
      !isFemaleSelected;
    } else {
      isFemaleSelected;
    }

    setState(() {});
  }
}
