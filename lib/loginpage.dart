import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceplatform/homepage.dart';
import 'package:ecommerceplatform/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  CollectionReference loginuser = FirebaseFirestore.instance.collection('loginuser');

 Future<void> loginUser() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('loginuser')
        .where('email', isEqualTo: email.text)
        .where('password', isEqualTo: password.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(
        );
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password.')),
 );
}
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
                       child: Column(
                        children: [
                         
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid)
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                             controller: password,
                            decoration: InputDecoration(
                              labelText: "password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid)
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            loginUser();
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProductPage();
                            }));  
                          }, 
                          child: Text("Login",style: TextStyle(
                            color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),))
                  
                  ],
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




