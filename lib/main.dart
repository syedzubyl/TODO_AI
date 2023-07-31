import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/Login.dart';
import 'package:todo/Register.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(

      ),
    );
  }
}
