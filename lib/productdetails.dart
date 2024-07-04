import 'package:ecommerceplatform/cartpage.dart';
import 'package:ecommerceplatform/products.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  Product product;
  String userid;
  List cart=[];
   ProductDetailsPage({super.key, required  this.product,required this.userid,required this.cart});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var user;


  Addtocart() async{
    
    List itemList = widget.cart;
    itemList.add(widget.product);
    final cart = await user.doc(widget.userid).update({"cart":itemList}).then(
      (value) => print("successs"),
       onError: (e) =>print(e));
    
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
                    height: 50,
                    width: 852,
                    padding: EdgeInsets.all(10),
                   child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                          return ProductPage();
                        }));
                   }, icon: Icon(Icons.backspace))
                  ),
                    Container(
                    decoration: BoxDecoration(
                         color:  Color.fromARGB(255, 245, 226, 61),
                      ),
                    height: 535,
                    width: 850,
                    padding: EdgeInsets.all(20),
                       child: Column(
                        children: [
                    Padding(
        padding:  EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Image.network(
                  widget.product.image,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image_search_rounded,
                  size: 200); // Show a placeholder or error icon
            },
                ),
              SizedBox(height: 16),
              Text(
               widget.product.productname,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "\$${widget.product.price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 16),
              Text(
                widget.product.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Addtocart();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CartPage()),
                  // );
                },
                child: Text("Add to Cart",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        )),
                        ]
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
                    height: 20,
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