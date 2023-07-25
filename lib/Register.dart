import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //begin: Alignment.topLeft,
            colors:[
              Colors.blue.shade900,
              Colors.blue.shade700,
              Colors.blue.shade300
            ]
          ),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60,),
             Padding(padding: const EdgeInsets.all(20),
               child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInUp( duration:const Duration(milliseconds: 1500),
                  child: const Text("Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white
                  ),),
                ),
                const SizedBox(height: 3,),
                FadeInUp( duration: const Duration(milliseconds: 2000),
                  child: const Text("Create New Account :-)" ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),),
                )
              ],
            ),
            ),
            const SizedBox(height: 40,),
            Expanded(
              child: Container(
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(60),topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const[
                             BoxShadow(
                              color: Color.fromRGBO(225, 97, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]
                        ),

                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey)),
                              ),
                              child: FadeInUp( duration: const Duration(milliseconds: 2000),
                                child: const  TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Name",
                                    hintStyle: TextStyle(fontSize: 18)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
