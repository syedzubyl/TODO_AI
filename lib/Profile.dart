import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  GoogleSignIn googleSignIn = new GoogleSignIn();

  void  showToast (String Message){
    Fluttertoast.showToast(msg: Message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(

          children: [
            const SizedBox(height: 280,),
            const Text("home page"),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut().then((onvalue){
                debugPrint("----in Logout----");

                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                showToast("successfully Logouted");
              } ).catchError((onError){
                debugPrint("---error on logout--- $onError");
              });
            }, child: Text("Sign out")),

          ],
        ),
      ),
    );
  }

  void SignOut() async {
    await googleSignIn.signOut();
    print("User Sign Out!");
  }
}
