import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/historyMeeting_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/screens/profile_screen.dart';
import 'package:zoom_clone/screens/settings_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  List pages = [
    MeetingScreen(),
    HistoryMeeting(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            'Meet & Chat',
          ),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            currentIndex: pageIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: footerColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
              BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock),
                label: 'Meeting',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings'),
            ]),
        body: pages[pageIndex]);
  }
}

//1 Icons.comment_bank , Meet & Chat

//2 Icons.lock_clock , Meeting

//3 Icons.person_outline , Contacts

//4 Icons.settings_outline, Settings
