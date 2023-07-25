import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade400,
              Colors.blue.shade100,
            ]
          )
        ),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 60,),
            Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FadeInUp( duration: const Duration(milliseconds: 1000),
                  child: const Text("Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                FadeInUp(duration: const Duration(milliseconds: 1200),
                  child: const Text("Welcome back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            ),
           const SizedBox(
              height: 20),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                     const SizedBox(height: 60,),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(225, 97, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ]
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding:const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color:
                                  Colors.grey.shade400),),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade800),
                                    hintText: "enter name",
                                    border: InputBorder.none,
                                  )
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade400))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Password ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade900),
                                    border:InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                      const SizedBox(height: 30,),
                      Text("Forgot Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade400),
                      ),
                      const SizedBox(height: 30,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => const Register()),
                        );
                      }, style : ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),

                        ),

                      ),child: const Text("Login",
                        style: TextStyle(
                          fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                      ),

                      const SizedBox(height: 30,),
                      Text("I Don't have An Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          color: Colors.grey.shade400)
                        ,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register() ));
                      }, child: Text("New Acc")),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(child:Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: const Center(
                              child: Text("Google"),
                            ),
                          ) ,),
                          const SizedBox(width: 160,),
                          Expanded(child:Container(
                            height: 50,
                            width: 10,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('asstes/googlelogo.jpg'),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: const Center(
                              child: Text(" rgewgwe"),
                            ),
                          ) ,
                          ),

                        ],
                      )
                    ],

                  ),
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
