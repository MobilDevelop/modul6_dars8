import 'package:flutter/material.dart';
import 'package:network_req/model/createmodel.dart';
class FourPage extends StatefulWidget {
  const FourPage({ Key? key, }) : super(key: key);

  @override
  _FourPageState createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("status: success"),
                  
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text("message: successfuly! deleted Records")
                  ],
                ),
            ],
          ),
      
    )
      
    );
  }
}