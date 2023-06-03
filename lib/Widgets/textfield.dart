import 'package:flutter/material.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';

class SmartLearnTextField extends StatefulWidget {
  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController controller;
  final TextInputType textInputType;

  const SmartLearnTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      required this.textInputType,
      required this.controller});

  @override
  State<SmartLearnTextField> createState() => _SmartLearnTextFieldState();
}

class _SmartLearnTextFieldState extends State<SmartLearnTextField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            fillColor: ColorConstants.lightBackground,
            filled: true,
            prefixIcon: widget.prefixIcon),
      ),
    );
  }
}
