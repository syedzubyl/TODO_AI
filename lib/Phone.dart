import 'package:flutter/material.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,

        ),
        child: Center(
          child: Text("Phone",
          style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}




