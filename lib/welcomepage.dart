import 'package:ecommerceplatform/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelComePage extends StatefulWidget {
  const WelComePage({super.key});

  @override
  State<WelComePage> createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRio7cRO5z4lLiH3YNp8eyd54iTjWh3-3w6g&s",height: 60,),
                        SizedBox(height: 10,),
                     Text("EaseCart",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                     SizedBox(height: 100,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomePage();
                        }));
                      }, child: Text("Start Shoping",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      style: ButtonStyle(backgroundColor:WidgetStateColor.transparent),)
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