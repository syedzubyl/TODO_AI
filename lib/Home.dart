import 'package:flutter/material.dart';
import 'package:todo/Login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        children: [
          SizedBox(height: 280,),
          Text("home page"),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login() ));
          }, child: Text("Sign out"))
        ],
      ),
      ),
    );
  }
}
