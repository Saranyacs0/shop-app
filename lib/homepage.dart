import 'package:ecommerceplatform/loginpage.dart';
import 'package:ecommerceplatform/signuppage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                 Container(
                    decoration: BoxDecoration(
                         color:  Color.fromARGB(255, 245, 226, 61),
                         borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                         )
                      ),
                    height: 30,
                    width: 852,
                  ),
                   Container(
                    decoration: BoxDecoration(
                         color:  Color.fromARGB(255, 245, 226, 61),
                      ),
                    height: 545,
                    width: 850,
                      child: Column(
                    children: [
                      SizedBox(height: 150,),
                      Text("Welcome",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),),
                        Text("EaseCart",style: TextStyle(color: Colors.black,fontSize: 15),),
                        SizedBox(height: 100,),
                        ElevatedButton(onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LoginPage();
                          }));
                        },
                         child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),),
                          SizedBox(height: 15,),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SignupPage();
                          }));
                        }, 
                        child: Text("SignUp",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),)
                    ],
                  ),
                  ),
                   Container(
                    decoration: BoxDecoration(
                         color:  Color.fromARGB(255, 245, 226, 61),
                         borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                         )
                      ),
                    height: 30,
                    width: 852,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}