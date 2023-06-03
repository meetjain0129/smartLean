import 'package:flutter/material.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';

class TextCardDesign extends StatelessWidget {
  final String title;
  const TextCardDesign({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 60,
      width: width * 0.9,
      child: Row(
        children: [
          Container(
            width: SizeConstant.width5,
            height: SizeConstant.buttonHeight,
            color: ColorConstants.yellow,
          ),
          CustomDesign().sizedBoxw10,
          SizedBox(
            width: width * 0.85,
            child: Text(
              title,
              style: CustomDesign().textcardDesign,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
