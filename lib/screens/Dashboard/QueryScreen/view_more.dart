import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/Widgets/text_carddesign.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:flutter_supabase/screens/Bottombar/bottombar.dart';
import 'package:flutter_supabase/screens/Dashboard/dashboard.dart';

class ViewMore extends StatefulWidget {
  final String queryTitle, experienceLevel, budget, description;
  final List<String> tagsList;
  const ViewMore(
      {super.key,
      required this.budget,
      required this.description,
      required this.experienceLevel,
      required this.queryTitle,
      required this.tagsList});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
          StringConstant.postQuery,
          style: CustomDesign().appBarTitle,
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.padding15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            TextCardDesign(title: widget.queryTitle),
            CustomDesign().sizedBox25,
            Text(
              StringConstant.tags.toUpperCase(),
              style: CustomDesign().text14600PrimaryColor,
            ),
            CustomDesign().sizedBox10,
            SizedBox(
              width: width,
              height: height * 0.05,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.tagsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: SizeConstant.padding3),
                        child: Chip(label: Text(widget.tagsList[index])));
                  }),
            ),
            CustomDesign().sizedBox25,
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
                        Text(widget.experienceLevel,
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
                    Text('₹ ${widget.budget}',
                        style: CustomDesign().text20600LightGrey)
                  ],
                ))
              ],
            ),
            CustomDesign().sizedBox25,
            Text(
              StringConstant.description,
              style: CustomDesign().text14600PrimaryColor,
            ),
            CustomDesign().sizedBox10,
            Text(
              widget.description,
              style: CustomDesign().text14400LHLightGrey,
            ),
            const Spacer(),
            Button(
                buttonTitle: 'Submit',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomBar()));
                },
                color: ColorConstants.primaryDark,
                textStyle: CustomDesign().getStarted),
            CustomDesign().sizedBox20,
            Bounce(
              duration: const Duration(milliseconds: 110),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                width: width,
                height: SizeConstant.buttonHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: ColorConstants.primaryDark, width: 1)),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: CustomDesign().textNormalPrimaryDark,
                  ),
                ),
              ),
            ),
            CustomDesign().sizedBox20,
          ],
        ),
      ),
    );
  }
}
