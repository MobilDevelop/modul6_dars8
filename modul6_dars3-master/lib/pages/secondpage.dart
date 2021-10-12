import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modul6_dars3/pages/homepage.dart';
import 'package:modul6_dars3/services/auth_service.dart';
import 'package:modul6_dars3/services/prefs_services.dart';
import 'package:modul6_dars3/services/utils_services.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({ Key key }) : super(key: key);
    static final String id  = "SecondPage";
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

   var isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
 
  

  void _isLogin(){

    String name  = nameController.text.toString().trim();
    String email  = emailController.text.toString().trim();
    String password  = passwordController.text.toString().trim();

    if(name.isEmpty || email.isEmpty || password.isEmpty) return;

    setState(() {
      isLoading = true;
    });
    AuthService.signUpUser(context, name, email, password).then((firebaseUser) => {
      _getFirebaseUser(firebaseUser),
    });

  }


  _getFirebaseUser(FirebaseUser firebaseUser) async {
    setState(() {
      isLoading = false;
    });
    if (firebaseUser != null) {
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      Utils.fireToast("Check your informations");
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
                Colors.grey.withOpacity(0.5),
                Colors.grey.withOpacity(0.4),
                Colors.grey.withOpacity(0.2),
                Colors.grey.withOpacity(0.1),
            ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: sizeof.height*0.04),
              Container(
                alignment: Alignment.bottomLeft,
                child: Icon(Icons.arrow_back,color: Colors.black,size: 25,),
              ),
              SizedBox(height: 10,),
              Text("Let's Get Started!",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Create an account to Q Allure to get all features",style: TextStyle(color: Colors.black45,fontSize: 13),),
              SizedBox(height: sizeof.height*0.25,),
              Container(
                width: double.infinity,
                height: sizeof.height*0.058,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2
                  ),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "FullName",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.person_outline)
                  ),
                ),
              ),
              SizedBox(height: 13,),
              Container(
                width: double.infinity,
                height: sizeof.height*0.058,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email)
                  ),
                ),
              ),
              SizedBox(height: 13,),
              Container(
                width: double.infinity,
                height: sizeof.height*0.058,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2
                  ),
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock_open_rounded)
                  ),
                ),
              ),
              SizedBox(height: sizeof.height*0.03,),

              Container(
                height:60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(.3),
                      blurRadius: 3,
                      spreadRadius: 3
                    )
                  ]
                ),
                child: FlatButton(onPressed: _isLogin
                , child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
              SizedBox(height: sizeof.height*0.03,),
              Container(
                 margin: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.black,fontSize: sizeof.width*0.03),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                     Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: Text("Sign In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: sizeof.width*0.03),))
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