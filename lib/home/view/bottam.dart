import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled17/home/view/news_Screen.dart';

import '../provider/bottam_provider.dart';

class bottomber_Screen extends StatefulWidget {
  const bottomber_Screen({Key? key}) : super(key: key);

  @override
  State<bottomber_Screen> createState() => _bottomber_ScreenState();
}

class _bottomber_ScreenState extends State<bottomber_Screen> {
  List WidgetsList = [
    News(),
    News(),
    News(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            WidgetsList[Provider.of<bootam_Provider>(context, listen: true).i],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            Provider.of<bootam_Provider>(context, listen: false)
                .changeicon(value);
          },
          currentIndex: Provider.of<bootam_Provider>(context, listen: true).i,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          backgroundColor: Color(0xff363535),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.slow_motion_video_sharp), label: "Video"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
