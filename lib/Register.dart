import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/Login.dart';
import 'package:todo/UserHelper.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 late String _name;
 late String _gmail;
 late String _password;
 late String _com_pass;

 bool _isLoading = false;

 void  showToast (String Message){
   Fluttertoast.showToast(msg: Message,
   toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     backgroundColor: Colors.black54,
     textColor: Colors.white,
   );}

 void   toggleLoading (){
   setState(() {
     _isLoading = !_isLoading;
   });
 }
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
                FadeInUp( duration:const Duration(milliseconds: 1000),
                  child: const Text("Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white
                  ),),
                ),
                const SizedBox(height: 3,),
                FadeInUp( duration: const Duration(milliseconds: 1200),
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
                  padding: EdgeInsets.all(25),
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
                              child:   TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter Name",
                                    hintStyle: TextStyle(fontSize: 18),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value){
                                    setState(() {
                                      _name =value;
                                    });
                                  },
                                ),

                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                                ),
                              child:TextField(
                                decoration:  const  InputDecoration(
                                  hintText: "Enter The Email",
                                  hintStyle: TextStyle(fontSize: 18),
                                  border: InputBorder.none

                                ),
                                onChanged: (value){
                                  setState(() {
                                    _gmail =value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child:  TextField(
                                decoration:const InputDecoration(
                                    hintText: "Enter The Password",
                                    hintStyle: TextStyle(fontSize: 18),
                                    border: InputBorder.none
                                ),
                                onChanged: (value){
                                  setState(() {
                                    _password = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: "Enter The Confirm Password",
                                    hintStyle: TextStyle(fontSize: 18),
                                    border: InputBorder.none
                                ),
                                onChanged: (value){
                                  setState(() {
                                    _com_pass =value;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),
                      _isLoading
                      ? const CircularProgressIndicator()
                          :ElevatedButton(onPressed: (){
                         debugPrint('Register');
                         debugPrint(
                           "Gmail: $_gmail, Name: $_name ,"
                               "Password: $_password, Conform_Password: $_com_pass");
                         if(_password != _com_pass){
                           showToast("The Password Do Not Match:");
                           return;
                         }
                         toggleLoading();
                         FirebaseAuth.instance.createUserWithEmailAndPassword(
                             email: _gmail, password: _password).
                        then((signedInUser){
                          debugPrint("Authenticated");
                          showToast("Registration successful!");
                          //UserHelper().storeNewUser(signedInUser,_name, context);
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Login()));
                          debugPrint("success");
                         }).catchError((error){
                           debugPrint("Error : $error");

                           if(error is FirebaseAuthException && error.code
                           == 'email-already exits'){
                             showToast("Email is already in use. please choose another gmail");
                           }
                           else{
                             showToast("Signup failed. Please try again later.");
                           }

                           toggleLoading();
                         });
                        },
                            style: ElevatedButton.styleFrom(

                            ),
                            child: Text("Register")),

                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("I have already Account"),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login() ));
                          }, child: const Text("Logged in !")),
                        ],
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
