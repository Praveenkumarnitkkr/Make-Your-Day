import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:make_your_day/Pages/First_Page.dart';
class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);
  @override
  _VerifyState createState() => _VerifyState();
}
class _VerifyState extends State<Verify> {
  final auth=FirebaseAuth.instance;
  late User user;
  late Timer timer;
  @override
  void initState() {
   user=auth.currentUser!;
   user.sendEmailVerification();
   timer=Timer.periodic(Duration(seconds: 2), (timer) {
     emailverify();
   });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "An Email verification link has been sent to you, Please verify..",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
   Future<void> emailverify() async{
    user=auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=>First_Page()),
              (Route<dynamic> route) => false);
    }
}
}
