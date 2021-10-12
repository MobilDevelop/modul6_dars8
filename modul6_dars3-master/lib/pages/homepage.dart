// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modul6_dars3/pages/logout.dart';
import 'package:modul6_dars3/pages/secondpage.dart';
import 'package:modul6_dars3/services/auth_service.dart';
import 'package:modul6_dars3/services/prefs_services.dart';
import 'package:modul6_dars3/services/utils_services.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key key }) : super(key: key);
      static final String id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


String myname="";

final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

  void _doLogin(){
  String email = emailcontroller.text.toString().trim();
  String password = passwordcontroller.text.toString().trim();

   AuthService.signInUser(context, email, password).then((firebaseuser) =>{

     _getFirebaseUser(firebaseuser),

   });
   
    
  }

  _getFirebaseUser(FirebaseUser firebaseuser) async{
        
      if(firebaseuser != null) {
        await Prefs.saveUserId(firebaseuser.uid);
      Navigator.pushReplacementNamed(context, LogOut.id);
      }else{
        Utils.fireToast("Chek your email or password");
      }
  }
  


 showName(String name){
    setState(() {
      myname = name;
    });
 }


  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context).size;
    return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[100],
            padding: EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: sizeof.height*0.05),
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/images4.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Text("Welcome back!",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("Log in to your existant account of Q Allure",style: TextStyle(color: Colors.grey,fontSize: 12),),
                  SizedBox(height: sizeof.height*0.15,),
                  Container(
                    height: sizeof.height*0.068,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "email",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: sizeof.height*0.068,
                    width: double.infinity,
                    decoration: BoxDecoration(
                       color: Colors.white,
                        border: Border.all(
                        color: Colors.grey,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: passwordcontroller,
                       decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                        prefixIcon: Icon(Icons.lock_open_rounded),
                      ),
                    ),
                  ),
                 
                    SizedBox(height: sizeof.height*0.03,),
                    Container(
                      height: sizeof.height*0.068,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal:10),
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          blurRadius: 5,
                          spreadRadius: 5
                        ), 
                      ],
                      borderRadius: BorderRadius.circular(10)

                      ),
                      child: FlatButton(onPressed: _doLogin,
                       child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 18),)
                       )
                    ),
                    
                    SizedBox(height: sizeof.height*0.04,),
                   Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                     child:  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Don't have-an account?",style: TextStyle(color: Colors.black54,fontSize: sizeof.width*0.038),),
                        SizedBox(width: 8,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, SecondPage.id);
                          },
                          child: Text(" Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: sizeof.width*0.038),))
                      ],
                    ),
                   )
                ],
              ),
            ),
          ),
    );
  }
}