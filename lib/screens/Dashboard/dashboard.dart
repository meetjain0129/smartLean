import 'package:flutter/material.dart';
import 'package:flutter_supabase/Widgets/card.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:flutter_supabase/screens/Dashboard/QueryScreen/createpost.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> cube = ['Rubix Cube', '3x3', 'Communication'];
  List<String> angles = ['Maths', 'Angles', 'Master'];

  CustomDesign customDesign = CustomDesign();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.primaryColor,
        title: Text(
          StringConstant.yourdashboard,
          style: customDesign.appBarTitle,
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: ColorConstants.lightBackground,
            )),
      ),
      body: Container(
        width: width,
        height: height,
        color: ColorConstants.lightBackground,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width,
                decoration: const BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(70, 40),
                      bottomRight: Radius.elliptical(70, 40),
                    )),
                child: Column(
                  children: [
                    Image.asset(AssetsPath.askQuery),
                    customDesign.sizedBox25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: SizeConstant.width5,
                          height: SizeConstant.buttonHeight,
                          color: ColorConstants.yellow,
                        ),
                        customDesign.sizedBoxw10,
                        Text(
                          StringConstant.askyourquery,
                          style: customDesign.askyourQuery,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    )
                  ],
                ),
              ),
              customDesign.sizedBox20,
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConstant.padding15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringConstant.qwuestions,
                            style: customDesign.text18600DarkBlue),
                        TextButton(
                            onPressed: () {},
                            child: Text(StringConstant.showall,
                                style: customDesign.text12400PrimaryColor))
                      ],
                    ),
                    SmartLearnCard(
                        query: 'CFOP in 3x3 Cube',
                        experienceLevel: 'Expert',
                        budget: 100,
                        description:
                            'Hi , I am a beginner in Rubik cube. I know the basics of the cube solving and I want to learn CFOP methods.',
                        tags: cube),
                    SmartLearnCard(
                        query: 'The angles of a quadrilateral',
                        experienceLevel: 'Expert',
                        budget: 400,
                        description:
                            'The angles of a quadrilateral are x°,(x+10)°,(x+20)°,(x+30)° Work out the value of x​',
                        tags: angles),
                    customDesign.sizedBox25,
                    Button(
                        buttonTitle: 'Have a question?',
                        onClick: () {},
                        color: ColorConstants.primaryDark,
                        textStyle: customDesign.getStarted),
                    SizedBox(
                      height: height * 0.15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreatePost()));
          },
          backgroundColor: ColorConstants.primaryDark,
          child: const Icon(Icons.add)),
    );
  }
}
