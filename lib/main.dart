import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled17/home/provider/news_provider.dart';
import 'package:untitled17/home/view/new_Screen.dart';
import 'package:untitled17/home/view/news_Screen.dart';
import 'package:untitled17/screen/provider/home_provider.dart';
import 'package:untitled17/screen/view/newsDetailescreen.dart';

import 'home/provider/bottam_provider.dart';
import 'home/view/bottam.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => NewsProvider(),),
        ChangeNotifierProvider(create: (context) => bootam_Provider(),),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'tab':(context) =>News(),
          '/':(context) => bottomber_Screen(),
          'second':(context) => NewsScreen(),
          'news':(context) => DetailScreen(),
        },
      ),
    ),
  );
}