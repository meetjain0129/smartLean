import 'package:flutter/material.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/Widgets/textfield.dart';
import 'package:flutter_supabase/appConstants/NavigationUtils/navigation_utils.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  CustomDesign customDesign = CustomDesign();

  //Initializing the controller
  TextEditingController resetPasswordEmailController = TextEditingController();
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
              Image.asset(AssetsPath.forgetPasword),
              Text(
                StringConstant.resetPassword,
                style: customDesign.resetPassword,
              ),
              customDesign.sizedBox20,
              Text(
                StringConstant.resetPassworddesp,
                style: customDesign.loginWithGoogle,
              ),
              SizedBox(
                height: height * 0.06,
              ),
              SmartLearnTextField(
                  hintText: 'Your Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: ColorConstants.primaryColor,
                  ),
                  textInputType: TextInputType.emailAddress,
                  controller: resetPasswordEmailController),
              SizedBox(
                height: height * 0.08,
              ),
              Button(
                  buttonTitle: StringConstant.sendVerificationLink,
                  onClick: () {},
                  color: ColorConstants.primaryDark,
                  textStyle: customDesign.getStarted)
            ],
          ),
        ),
      ),
    );
  }
}
