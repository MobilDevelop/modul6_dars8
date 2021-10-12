import 'package:flutter/material.dart';
class LogOut extends StatefulWidget {
  const LogOut({ Key key }) : super(key: key);
    static final String id = "LogOut";
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("LogOut"),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){

          },
          child: Text("LogOut"),
        ),
      ),
    );
  }
}