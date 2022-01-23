import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Notes/Show_Notes.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class Write_Note extends StatefulWidget {
  const Write_Note({Key? key}) : super(key: key);
  @override
  _Write_NoteState createState() => _Write_NoteState();
}
class _Write_NoteState extends State<Write_Note> {
  bool showspin=false;
  final key= GlobalKey<FormState>();
  final titletext=TextEditingController();
  final destext=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write Day",style: GoogleFonts.balooBhai(),),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.brown,
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
          child: Column(
            children: [
              Form(
                  key: key,
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: titletext,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Title",
                                    hintStyle: GoogleFonts.indieFlower(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )
                                ),
                                // onChanged: (value){
                                //     value=titletext.text;
                                // },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter your Title';
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextFormField(
                                controller: destext,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    border:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Description",
                                  hintStyle: GoogleFonts.dancingScript()
                                ),
                                // onChanged: (value){
                                //   value=destext.text;
                                // },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Please write your description";
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.blueGrey,
                                  Colors.lightBlueAccent,
                                  Colors.blueGrey,
                                ]
                            )
                        ),
                        child: ButtonTheme(
                          splashColor: Colors.pink,
                          child: TextButton(
                              onPressed: () async{
                                if(key.currentState!.validate()){
                                  setState(() {
                                    showspin=true;
                                  });
                                  addnote();
                                }
                              },
                              child:Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addnote() async{
    CollectionReference ref= FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Notes');
    var data={
      'title': titletext.text,
      'description': destext.text,
      'Time': DateTime.now(),
    };
    ref.add(data).then((value) => {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>Show_notes())
      )
    }).catchError((e){
      setState(() {
        showspin=false;
      });
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
