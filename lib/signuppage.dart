import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceplatform/homepage.dart';
import 'package:ecommerceplatform/products.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  List cart=[];

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontoller = TextEditingController();
  
CollectionReference user = FirebaseFirestore.instance.collection('user');
  Future<void> addUser() {
  return user
      .add({
        'username': usernamecontroller.text,
        'Email': emailcontroller.text,
        'password': passwordcontoller.text,
        'cart': [] 

      })
      .then((value) =>print("SignUp"))
      .catchError((error) => print("Failed to add user: $error"));
}

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
                    padding: EdgeInsets.all(20),
                       child: Expanded(
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                         children:[
                          TextField(
                            controller: usernamecontroller,
                            decoration: InputDecoration(
                              hintText: "Type your Name",
                              labelText: "Name",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: emailcontroller,
                           decoration: InputDecoration(
                             hintText: "Type your email",
                              labelText: "email",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: passwordcontoller,
                            decoration: InputDecoration(
                               hintText: "Type your password",
                              labelText: "password",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            addUser();
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProductPage();
                            }));
                          }, child: Text("SignUp",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:15),))
                         ],
                          ),
                       ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                         color:   Color.fromARGB(255, 245, 226, 61),
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