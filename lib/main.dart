import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled17/screen/provider/home_provider.dart';
import 'package:untitled17/screen/view/home_Screen.dart';
import 'package:untitled17/screen/view/second_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
          'second':(context) => SecondSCreen(),
        },
      ),
    ),
  );
}