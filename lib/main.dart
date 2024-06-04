import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home.dart';
import 'package:whatsapp/screens/login.dart';
import 'package:whatsapp/screens/phoneregister.dart';
import 'package:whatsapp/screens/whatsapphome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),)
  );
}
