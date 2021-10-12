import 'package:flutter/material.dart';
import 'package:network_req/model/createmodel.dart';
import 'package:network_req/model/emp_model.dart';
import 'package:network_req/model/emplist_model.dart';
import 'package:network_req/model/user_model.dart';
import 'package:network_req/pages/fourpage.dart';
import 'package:network_req/pages/secondpage.dart';
import 'package:network_req/servis/http_server.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static final String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];

  void _apiEmpList() {
    Network.GET(Network.Get, Network.paramsEmpty()).then((response) => {
             
              _showResponse(response),
            
        });
  }

  void _apiCreateModel() {
    Network.POST(Network.Post, Network.paramsCreate(User("test", "123", "23")))
        .then((response) => {
              showmadel(response)
            });
  }

  void _showResponse(String response) {
    EmpList empList = Network.parseEmpList(response);
    setState(() {
      items = empList.data;
    });
  }


 void showmadel(String response){
   CreateModel model = Network.parseModel(response);
  
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
        actions: [
          IconButton(onPressed: (){
              _apiCreateModel();
          }, icon:Icon(Icons.person_add))
        ],
        
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SecondPage(emplo: items[i])));
              },
              child: itemOfList(items[i]));
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emp.employee_name + "(" + emp.employee_age.toString() + ")",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            emp.employee_salary.toString() + "\$",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
 
}
