import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/Splash.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(brightness:Brightness.light),
      home:  const Splash(

      ),
    );
  }
}
