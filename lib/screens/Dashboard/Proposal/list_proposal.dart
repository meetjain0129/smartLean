import 'package:flutter/material.dart';
import 'package:flutter_supabase/Widgets/text_carddesign.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:get/get.dart';

class ListProposal extends StatefulWidget {
  const ListProposal({super.key});

  @override
  State<ListProposal> createState() => _ListProposalState();
}

class _ListProposalState extends State<ListProposal> {
  // List for the proposal which is given by the different teachers
  List<SmartLearnTeacherCardList> proposalList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: ColorConstants.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          StringConstant.listofproposal,
          style: CustomDesign().appBarTitle,
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: ColorConstants.lightBackground,
        padding: const EdgeInsets.symmetric(
          horizontal: SizeConstant.padding15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDesign().sizedBox20,
            const TextCardDesign(title: 'CFOP methods in 3x3 cube'),
            CustomDesign().sizedBox20,
            ListView.builder(
              itemBuilder: (context, index) {
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

class SmartLearnTeacherCardList {
  String teacherImg, teacherName, experienceLevel, coverLetter;
  int budget, ratings;
  List tags;
  SmartLearnTeacherCardList(
      {required this.teacherImg,
      required this.teacherName,
      required this.experienceLevel,
      required this.coverLetter,
      required this.budget,
      required this.ratings,
      required this.tags});
}
