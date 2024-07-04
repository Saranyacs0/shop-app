
import 'package:ecommerceplatform/firebase_options.dart';
import 'package:ecommerceplatform/loginpage.dart';
import 'package:ecommerceplatform/signuppage.dart';
import 'package:ecommerceplatform/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EaseCart());
}


class EaseCart extends StatelessWidget {
  const EaseCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelComePage(),);
  }
}