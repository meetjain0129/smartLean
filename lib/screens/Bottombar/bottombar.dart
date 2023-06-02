import 'package:flutter/material.dart';
import 'package:flutter_supabase/appConstants/colorConstant/color_constant.dart';
import 'package:flutter_supabase/appConstants/stringConstant/string_constant.dart';
import 'package:flutter_supabase/screens/Dashboard/chat.dart';
import 'package:flutter_supabase/screens/Dashboard/dashboard.dart';
import 'package:flutter_supabase/screens/Dashboard/notification.dart';
import 'package:flutter_supabase/screens/Dashboard/profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> screens = [
    const Dashboard(),
    const ChatScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: ColorConstants.lightBackground,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorConstants.primaryColor,
          unselectedItemColor: ColorConstants.whitegrey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: StringConstant.dashboard),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outlined),
                label: StringConstant.chat),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_sharp),
                label: StringConstant.notification),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: StringConstant.profile)
          ]),
    );
  }
}
