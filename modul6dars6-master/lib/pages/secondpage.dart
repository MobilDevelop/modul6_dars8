import 'package:flutter/material.dart';
import 'package:network_req/model/emp_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.emplo}) : super(key: key);
  final Employee emplo;
  static final String id ="SecondPage";
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Paga"),
        ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.emplo.employee_name + "(" + widget.emplo.employee_age.toString() + ")",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.emplo.employee_salary.toString() + "\$",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
