import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:make_your_day/Model/User_Model.dart';
import 'package:make_your_day/Pages/First_Page.dart';
import 'package:make_your_day/Pages/verify_email.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class User_Page extends StatefulWidget {
  const User_Page({Key? key}) : super(key: key);
  @override
  _User_PageState createState() => _User_PageState();
}
class _User_PageState extends State<User_Page> {
  bool showspin=false;
  usermodel Loggedin=usermodel();
  User? user=FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("users")
        .doc(user!.uid).get()
        .then((value){
      this.Loggedin=usermodel.fromMap(value.data());
      setState(() {});
    });
  }
  final key=GlobalKey<FormState>();
  final Name=TextEditingController();
  final Sur=TextEditingController();
  final Email=TextEditingController();
  final Pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.blueGrey,
                Colors.blueAccent,
                Colors.blueGrey,
              ]
            )
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspin,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "please enter your name";
                            }
                          },
                          controller: Name,
                          decoration: InputDecoration(
                            labelText: "${Loggedin.name}",
                            hintText:"Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: Sur,
                          decoration: InputDecoration(
                            labelText: "${Loggedin.secondname}",
                            hintText: "Second Name"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your email-id";
                            }
                          },
                          controller: Email,
                          decoration: InputDecoration(
                            labelText: "${Loggedin.email}",
                            hintText: "Email-id"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: Pass,
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Minimum 6 character";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Passowrd",
                            hintText: "New Passowrd",
                            hintStyle:TextStyle(
                            )
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(20),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.blueGrey,
                                Colors.blueAccent,
                                Colors.blueGrey,
                              ]
                            )
                          ),
                          child: TextButton(
                            onPressed: () async {
                             Map<String,dynamic>toMap(){
                               return {
                                 'name': Name.text,
                                 'secondname': Sur.text,
                                 'email':Email.text,
                                 'pass': Pass.text,
                               };
                             }

                             if(key.currentState!.validate()){
                               setState(() {
                                 showspin=true;
                               });
                               if(Email.text==Loggedin.email){
                                 FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update(toMap()).then((value) async => {
                                   await FirebaseAuth.instance.currentUser!.updatePassword(Pass.text),
                                 Fluttertoast.showToast(msg: "Updated successfully"),
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>First_Page()))
                               }).catchError((e){
                                 setState(() {
                                   showspin=false;
                                 });
                                 Fluttertoast.showToast(msg: e!.message);
                               });
                               }
                               else
                                 FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update(toMap()).then((value) async => {
                                   FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(Email.text),
                                   await FirebaseAuth.instance.currentUser!.updatePassword(Pass.text),
                                   Fluttertoast.showToast(msg: "Updated successfully"),
                                   Navigator.pushAndRemoveUntil(
                                       context,
                                       MaterialPageRoute(
                                       builder: (context)=>Verify()),
                                         (Route<dynamic> route) => false,
                                   )
                                 }).catchError((e){
                                   setState(() {
                                     showspin=false;
                                   });
                                   Fluttertoast.showToast(msg: e!.message);
                                 });
                             }
                            },
                            child: Text(
                                "Update",
                              style: TextStyle(
                                  color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
