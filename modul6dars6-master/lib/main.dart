import 'package:flutter/material.dart';
import 'package:network_req/pages/fourpage.dart';
import 'package:network_req/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: FourPage(),
      routes: {
        HomePage.id: (context)=>HomePage(),
      },
    );
  }
}

