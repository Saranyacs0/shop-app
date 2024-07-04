import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceplatform/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceplatform/addpage.dart';
import 'package:ecommerceplatform/cartpage.dart';
import 'package:ecommerceplatform/homepage.dart';
import 'package:ecommerceplatform/loginpage.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 226, 61),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: 50,
              width: 852,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    icon: Icon(Icons.home),
                  ),
                  SizedBox(width: 300),
                  Text(
                    "Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    SizedBox(width: 285),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddProducts()),
                      );
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart_checkout),
                  ),
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 226, 61),
                ),
                width: 850,
                child: ProductGrid(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 226, 61),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              height: 20,
              width: 852,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final products = snapshot.data!.docs.map((doc) {
              return Product.fromDocument(doc);
            }).toList();

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            );
          },
        
    );
  }
}

class Product {
  final String productname;
  final String price;
  final String image; 
  final String description;

  Product(
      {
      required this.productname,
      required this.price,
      required this.image,
      required this.description,});

  factory Product.fromDocument(DocumentSnapshot doc) {
    return Product(
    
      productname: doc['productname'],
      price: doc['price'],
      image: doc['image'],
      description: doc['description'],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(foregroundImage: NetworkImage(product.image),radius:(25.0),),
                      title: Text(product.productname,style: TextStyle(color: Colors.black),),
                      subtitle: Text( "\$${product.price}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProductDetailsPage(
                            userid:"123",
                            cart: [],
                            product: product);
                        }));
                      },
                    ),
    );
  }
}