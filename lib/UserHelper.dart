import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Login.dart';

class UserHelper {
  storeNewUser(user,username,context){
    print("user is ${user.user.providerData[0]}");
    FirebaseFirestore.instance.collection("/user").add({
      "gmail" : user.user.proviedData[0].gmail,
      "uid" : user.user.proviedData[0].uid,
      "username" : username,
    }).then((status){
      print("Collection created successfully  $status");
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=> const Login()));
    }).catchError((err){
       print("error is creating  collection--- $err");
    });
  }
}