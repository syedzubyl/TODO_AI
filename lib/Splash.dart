import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:todo/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async {
     await Future.delayed(const Duration(milliseconds: 3000), (){});
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.blue.shade900, Colors.blue.shade500, Colors.blue.shade300],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the "data" text vertically
                  children: [
                    FadeInUp(duration: Duration(milliseconds: 1200),
                      child: Text("TODO" , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white

                      ),),
                    ),
                    FadeInUp(duration: Duration(milliseconds: 1500),
                      child: Text("Makes you lits notes" , style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white

                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

