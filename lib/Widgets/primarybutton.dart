import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.buttonTitle,
      required this.onClick,
      required this.color,
      required this.textStyle});

  final String buttonTitle;
  final VoidCallback onClick;
  final Color color;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    //Initializing MediaQuery Height and Width
    var width = MediaQuery.of(context).size.width;
    return Bounce(
      duration: const Duration(milliseconds: 110),
      onPressed: onClick,
      child: Container(
        width: width,
        height: SizeConstant.buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
