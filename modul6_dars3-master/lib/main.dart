import 'package:flutter/material.dart';
import 'package:modul6_dars3/pages/homepage.dart';
import 'package:modul6_dars3/pages/logout.dart';
import 'package:modul6_dars3/pages/secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context)=>HomePage(),
        SecondPage.id: (context)=>SecondPage(),
        LogOut.id: (context)=>LogOut(),
      },
    );
  }
}

