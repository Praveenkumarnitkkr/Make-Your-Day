import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_your_day/Pages/Quotes_Categories.dart';
import 'package:make_your_day/Pages/Sign_Up_Page.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/First_Page.dart';
import 'Pages/Sign_In_Page.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(OverlaySupport(
    child: MaterialApp(
        debugShowCheckedModeBanner:false,
      home: (FirebaseAuth.instance.currentUser?.emailVerified ?? false) ? First_Page() : Sign_In_Page(),
      routes: {
       '/First_Page':(context)=>First_Page(),
        '/Sign_in_Page':(context)=>Sign_In_Page(),
        '/Sing_Up_Page':(context)=>Sign_UP(),
        '/second_page':(context)=>Quote_Categories(),
      },
    ),
  ));
}


