import 'package:flutter/material.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/appConstants/NavigationUtils/navigation_utils.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:get/get.dart';

class ProposalAccepted extends StatefulWidget {
  const ProposalAccepted({super.key});

  @override
  State<ProposalAccepted> createState() => _ProposalAcceptedState();
}

class _ProposalAcceptedState extends State<ProposalAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              NavigationUtils().openPreviousScreen();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstants.darkBlue,
            )),
        backgroundColor: ColorConstants.lightWhite,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: ColorConstants.lightWhite,
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.padding15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsPath.lovedyourchoice),
            Text(
              StringConstant.lovedyourchoice,
              style: CustomDesign().resetPassword,
            ),
            CustomDesign().sizedBox20,
            Text(
              StringConstant.lovedyourchoicedesp,
              style: CustomDesign().text14400LHLightGrey,
            ),
            const Spacer(),
            Button(
                buttonTitle: 'Go to payments',
                onClick: () {
                  NavigationUtils().openDashBoardScreen();
                },
                color: ColorConstants.primaryDark,
                textStyle: CustomDesign().getStarted),
            SizedBox(
              height: Get.height * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
