import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:make_your_day/Model/User_Model.dart';
import 'package:make_your_day/Pages/verify_email.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class Sign_UP extends StatefulWidget {
  const Sign_UP({Key? key}) : super(key: key);
  @override
  _Sign_UPState createState() => _Sign_UPState();
}
class _Sign_UPState extends State<Sign_UP> {
  bool showspin=false;
  final _formkey= GlobalKey<FormState>();
  final _auth= FirebaseAuth.instance;
  final name=TextEditingController();
  final sur_name=TextEditingController();
  final password=TextEditingController();
  final confirm_pass=TextEditingController();
  final Email_id=TextEditingController();
  String labeltext=' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Make Your Day",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        elevation: 10,
        shadowColor: Colors.blueAccent,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.blueGrey,
                    Colors.lightBlueAccent,
                    Colors.blueGrey,
                  ]
              )
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspin,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 10,),
                  SizedBox(
                     child: Image(
                       width: 200,
                       height: 200,
                       fit: BoxFit.contain,
                       image: AssetImage('lib/images/app.png'),
                     )
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              hintText: "Name",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please provide your First Name";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: sur_name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              hintText: "Sur name",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please provide Sur Name";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: Email_id,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(
                                Icons.mail,
                              ),
                              hintText: "Email-id",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please provide Your Email-id";
                              }
                              else if(Email_id.text[value.length-1]!='m'){
                                return "Please enter a valid Email-id";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key,
                              ),
                              hintText: "Password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a password";
                              }
                              else if (value.length < 6) {
                                return "Password length should be more than 6";
                              }
                            }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: confirm_pass,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key,
                              ),
                              hintText: "Confirm Password",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please enter your password";
                              }
                              else if(confirm_pass.text!=password.text){
                                return "Password doesn't match";
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    Colors.blueGrey,
                                    Colors.lightBlueAccent,
                                    Colors.blueGrey,
                                  ]
                              )
                          ),
                          width: MediaQuery.of(context).size.width*0.90,
                          child: TextButton(
                            onPressed: () async{
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    showspin=true;
                                  });
                               _auth.createUserWithEmailAndPassword
                            (email: Email_id.text, password: password.text)
                                .then((value) =>
                            {
                                postdetail(),
                           Navigator.pushAndRemoveUntil(context,
                         MaterialPageRoute(builder: (context)=>Verify()),
                               (Route<dynamic> route) => false),
                         }).catchError((e){
                           setState((){
                             showspin=false;
                           });
                           Fluttertoast.showToast(msg:e!.message);
                             });
                                }
                              },
                            child: Text(
                              'Sign-Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  postdetail() async{
    //calling firestore
    //calling usermodel
    //sending these values
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User? user=_auth.currentUser;
    usermodel usermo =usermodel();
    usermo.email=user!.email;
    usermo.uid=user.uid;
    usermo.name=name.text;
    usermo.pass=password.text;
    usermo.secondname=sur_name.text;
    await firebaseFirestore.collection("users").doc(user.uid).set(usermo.toMap());
  }

}
