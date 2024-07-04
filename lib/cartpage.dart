import 'package:ecommerceplatform/homepage.dart';
import 'package:ecommerceplatform/loginpage.dart';
import 'package:ecommerceplatform/products.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  width: 852,
                  decoration: BoxDecoration(
                     color:  Color.fromARGB(255, 245, 226, 61),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )
                  ),
                 padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context){
                          return HomePage();
                        }));
                      }, icon: Icon(Icons.home)),
                      SizedBox(width: 300,),
                      Text("Cart Products",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(width: 280,),
                      IconButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder:(context){
                          return ProductPage();
                        }));
                      }, icon: Icon(Icons.shopping_bag_outlined)),
                      SizedBox(width:10,),
                      IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                    ],
                  ),
                ),
                Container(
                  width: 850,
                  height: 535,
                  color:  Color.fromARGB(255, 245, 226, 61),
                 child: Column(
                  children: [
                    
                  ],
                 ),

                ),
               Container(
                  height: 20,
                  width: 852,
                  decoration: BoxDecoration(
                     color:  Color.fromARGB(255, 245, 226, 61),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}