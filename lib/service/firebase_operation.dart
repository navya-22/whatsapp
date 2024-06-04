

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/whatsapphome.dart';

class AuthService{
  Future<void>register({
    required String name,
    required String email,required String password,
    required BuildContext context
  }) async{
    try{
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Whatsapp_Home(),));
      //return user?.uid;
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text(e.toString()),
      ));
      //print(e);
    }
    print('hello');
  }

  Future<void>login({required String email,required String password,required BuildContext context})async {
    try{
      var data = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Whatsapp_Home(),));
      print(data);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
 Future<void> text({required String text}) async {
    print(text);
 }
}
