import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Pages/Aboutme.dart';
import 'package:make_your_day/Pages/First_Page.dart';
import 'package:make_your_day/Pages/Sign_In_Page.dart';
import 'package:make_your_day/Pages/User_Page.dart';
import 'package:make_your_day/Model/User_Model.dart';
class Drawer_Page extends StatefulWidget {
  const Drawer_Page({Key? key}) : super(key: key);
  @override
  _Drawer_PageState createState() => _Drawer_PageState();
}
class _Drawer_PageState extends State<Drawer_Page> {
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
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.white,
      ),
      child: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: MediaQuery.of(context).size.height*0.35,
                decoration: BoxDecoration(
                  gradient:LinearGradient(
                      colors: <Color>[
                        Colors.yellowAccent,
                        Colors.lightBlueAccent,
                        // Colors.white,
                      ]
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/Mynew2.jpg'),
                          radius: 50,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "${Loggedin.name}",
                          style:GoogleFonts.balooBhai(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${Loggedin.email}",
                          style:GoogleFonts.balooBhai(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonTheme(
                splashColor: Colors.blueAccent,
                minWidth: 200,
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>First_Page()));
                    },
                    child:Row(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Home',
                          style: GoogleFonts.balooBhai(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), ButtonTheme(
                splashColor: Colors.blueAccent,
                minWidth: 200,
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context)=>User_Page()));
                    },
                    child:Row(
                      children: [
                        Icon(
                          Icons.person,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'User',
                          style: GoogleFonts.balooBhai(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonTheme(
                splashColor: Colors.blueAccent,
                minWidth: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut().then((value) =>
                      {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context){
                              return Sign_In_Page();
                            })
                        )
                      }).catchError((e){
                        Fluttertoast.showToast(msg: e!.message);
                      });

                    },
                    child:Row(
                      children: [
                        Icon(
                          Icons.person,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'sign-out',
                          style: GoogleFonts.balooBhai(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),SizedBox(
                height: 10,
              ),
              ButtonTheme(
                splashColor: Colors.blueAccent,
                minWidth: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: () async{
                       Navigator.push(context,  MaterialPageRoute(builder: (context)=>About()));
                      },
                    child:Row(
                      children: [
                        Icon(
                          Icons.person_sharp,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'About-me',
                          style: GoogleFonts.balooBhai(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
