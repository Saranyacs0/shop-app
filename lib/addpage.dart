import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceplatform/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

TextEditingController namecontroller = TextEditingController();
TextEditingController pricecontroller = TextEditingController();
TextEditingController imagecontoller = TextEditingController();
TextEditingController detailscontroller = TextEditingController();


  CollectionReference products = FirebaseFirestore.instance.collection('products');
  Future<void> AddProducts() {
  return products
      .add({
        'productname': namecontroller.text,
        'price': pricecontroller.text,
        'image': imagecontoller.text,
        'description':detailscontroller.text,

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
                    width: 352,
                  ),
                    Container(
                    decoration: BoxDecoration(
                         color:  Color.fromARGB(255, 245, 226, 61),
                      ),
                    height: 545,
                    width: 350,
                    padding: EdgeInsets.all(20),
                       child: Expanded(
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                         children:[
                          TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              hintText: "Type Product Name",
                              labelText: "Product Name",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: pricecontroller,
                           decoration: InputDecoration(
                             hintText: "Type Product price",
                              labelText: "Price",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: imagecontoller,
                            decoration: InputDecoration(
                               hintText: "image",
                              labelText: "image",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: detailscontroller,
                            decoration: InputDecoration(
                               hintText: "Type Product Description",
                              labelText: "Description",
                              border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,))
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                             AddProducts();
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProductPage();
                            }));
                          }, child: Text("ADD",style: TextStyle(
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
                    width: 352,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}