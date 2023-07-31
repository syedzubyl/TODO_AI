import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/Home.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late String _email;
  late  String _password ;
  GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
            Padding(padding: const EdgeInsets.all(20),
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
                const SizedBox(height: 10,),
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
                                    hintText: "Enter The Gmail",
                                    border: InputBorder.none,

                                  ),
                                  onChanged: (value){
                                    setState((){
                                      _email =value;
                                    });
                                  },

                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade400))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: " Password ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade900),
                                    border:InputBorder.none,

                                  ),
                                  onChanged: (value){
                                    setState(() {
                                      _password =value;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),

                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot Password !",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      ElevatedButton(onPressed: (){
                        debugPrint("Login !");
                        if(_email.trim().isEmpty || _password.trim().isEmpty){
                          debugPrint("Email or Password is empty.");
                          return;
                        }
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email, password: _password).then((user){
                           
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                        }).catchError((onError){
                          debugPrint(onError);
                        });
                        }, style : ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),

                        ),


                      ),
                          child: const Text("Login",
                        style: TextStyle(
                          fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                      ),

                      const SizedBox(height: 30,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("I Don't have a Account"),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register() ));
                          }, child: const Text("create New Acc ?")),
                        ],
                      ),

                      const SizedBox(height: 30,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => Home())
                        );
                      },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(250, 50),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,vertical: 10,),
                            shadowColor: Colors.grey.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)
                            ),

                            backgroundColor: Colors.black54
                          ),

                          child: const Text(
                            "Goolge",style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
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

class GoogleSignIn {
}
