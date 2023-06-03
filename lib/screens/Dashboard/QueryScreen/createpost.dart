import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_supabase/Widgets/primarybutton.dart';
import 'package:flutter_supabase/Widgets/text_carddesign.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/customDesign/custom_design.dart';
import 'package:flutter_supabase/appConstants/sizeConstant/size_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:flutter_supabase/screens/Bottombar/bottombar.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  // Declaring the empty tags list
  List<String> tags = [];

  //Initializing the TextField Controller
  TextEditingController headlineController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        elevation: 1,
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
        color: ColorConstants.lightBackground,
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.padding15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDesign().sizedBox25,
              const TextCardDesign(title: StringConstant.createPost),
              CustomDesign().sizedBox10,
              Text(
                StringConstant.createPostDescription,
                style: CustomDesign().text14400LHLightGrey,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                StringConstant.headlineText,
                style: CustomDesign().primaryDarkText,
              ),
              CustomDesign().sizedBox10,
              TextField(
                controller: headlineController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15.0),
                    hintText: 'Enter Headline',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.5),
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30))),
              ),
              CustomDesign().sizedBox20,
              Text(
                StringConstant.enterTags,
                style: CustomDesign().primaryDarkText,
              ),
              CustomDesign().sizedBox10,
              TextField(
                controller: tagsController,
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (value) {
                  setState(() {
                    tags.add(value);
                    tagsController.clear();
                  });
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15.0),
                    hintText: 'Search for tags',
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: ColorConstants.lightgrey,
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.5),
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30))),
              ),
              tags.isEmpty
                  ? const SizedBox()
                  : SizedBox(
                      width: width,
                      height: height * 0.2,
                      child: ListView.builder(
                        itemCount: tags.length,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              child: Chip(
                                label: Text(tags[index]),
                                onDeleted: () {
                                  setState(() {
                                    tags.remove(tags[index]);
                                  });
                                },
                              ));
                        },
                      ),
                    ),
              CustomDesign().sizedBox20,
              Text(
                StringConstant.experienceLevel,
                style: CustomDesign().primaryDarkText,
              ),
              CustomDesign().sizedBox10,
              // Row(
              //   children: [
              //     Radio(value: , groupValue: groupValue, onChanged: onChanged)
              //   ],
              // )
              CustomDesign().sizedBox20,
              Text(
                StringConstant.yourBudget,
                style: CustomDesign().primaryDarkText,
              ),
              CustomDesign().sizedBox10,
              TextField(
                controller: tagsController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.phone,
                onSubmitted: (value) {
                  setState(() {
                    tags.add(value);
                    tagsController.clear();
                  });
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15.0),
                    hintText: '100',
                    prefixIcon: const Icon(
                      Icons.currency_exchange,
                      color: ColorConstants.lightgrey,
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.5),
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30))),
              ),
              CustomDesign().sizedBox20,
              Text(
                StringConstant.descriptionTxt,
                style: CustomDesign().primaryDarkText,
              ),
              CustomDesign().sizedBox10,
              TextField(
                controller: tagsController,
                minLines: 5,
                maxLines: 7,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.name,
                onSubmitted: (value) {
                  setState(() {
                    tags.add(value);
                    tagsController.clear();
                  });
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    hintText: 'Placeholders',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.5),
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(15))),
              ),
              CustomDesign().sizedBox20,
              Button(
                  buttonTitle: 'Submit',
                  onClick: () {
                    FocusScope.of(context).unfocus();
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
      ),
    );
  }
}
