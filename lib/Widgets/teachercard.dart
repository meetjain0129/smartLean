import 'package:flutter/material.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';

class SmartLearnTeacherCard extends StatelessWidget {
  final String teacherName, teacherImg, coverLetter, experienceLevel;
  final int ratings;
  final List<String> tags;
  final int budget;
  const SmartLearnTeacherCard(
      {super.key,
      required this.teacherImg,
      required this.teacherName,
      required this.ratings,
      required this.experienceLevel,
      required this.budget,
      required this.coverLetter,
      required this.tags});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: SizeConstant.padding15),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(
              horizontal: SizeConstant.padding15,
              vertical: SizeConstant.padding15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(teacherName, style: CustomDesign().text20700DarkBlue),
              CustomDesign().sizedBox5,
              Text(
                StringConstant.tags,
                style: CustomDesign().text14600PrimaryColor,
              ),
              CustomDesign().sizedBox10,
              SizedBox(
                width: width,
                height: height * 0.05,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tags.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: SizeConstant.padding3),
                          child: Chip(label: Text(tags[index])));
                    }),
              ),
              CustomDesign().sizedBox10,
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstant.experience,
                            style: CustomDesign().text14600PrimaryColor,
                          ),
                          CustomDesign().sizedBox5,
                          Text(experienceLevel,
                              style: CustomDesign().text20600LightGrey)
                        ],
                      )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstant.budget,
                        style: CustomDesign().text14600PrimaryColor,
                      ),
                      CustomDesign().sizedBox5,
                      Text('₹ $budget',
                          style: CustomDesign().text20600LightGrey)
                    ],
                  ))
                ],
              ),
              CustomDesign().sizedBox10,
              Text(
                StringConstant.description,
                style: CustomDesign().text14600PrimaryColor,
              ),
              CustomDesign().sizedBox10,
              Text(
                coverLetter,
                style: CustomDesign().text14400LHLightGrey,
              ),
              CustomDesign().sizedBox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    backgroundColor: ColorConstants.primaryColor,
                    child: Icon(
                      Icons.edit,
                      color: ColorConstants.lightWhite,
                    ),
                  ),
                  CustomDesign().sizedBoxw5,
                  const CircleAvatar(
                    backgroundColor: ColorConstants.primaryColor,
                    child: Icon(
                      Icons.delete,
                      color: ColorConstants.lightWhite,
                    ),
                  ),
                  CustomDesign().sizedBoxw5,
                  SizedBox(
                    width: width * 0.28,
                    height: 40,
                    child: Button(
                        buttonTitle: 'View More',
                        onClick: () {},
                        color: ColorConstants.primaryColor,
                        textStyle: CustomDesign().getStarted),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
