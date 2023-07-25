import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/Login.dart';
import 'package:todo/Register.dart';
import 'package:todo/Splash.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // Set your desired color
      systemNavigationBarDividerColor: Colors.transparent,),); // Set your desired color
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(

      ),
    );
  }
}
