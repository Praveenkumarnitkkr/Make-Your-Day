import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  final publishtext=TextEditingController();
  final key= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publish'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: key,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(50),
                      child: Text("Here You can share your thought and get a chance to Publish it with your name"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                           border:OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                           ),
                          hintText: "Enter your thoughts"
                        ),
                        maxLines: 10,
                        controller: publishtext,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter a value";
                          }
                          else if(value.length<5){
                            return "Less than 5 character";
                          }
                        },
                      ),
                    ),
                     Padding(
                       padding: EdgeInsets.only(left: 300),
                       child: TextButton(
                           onPressed: (){
                             if(key.currentState!.validate()){
                               sendtoauthor(publishtext.toString());
                             }
                           },
                           child: Row(
                             children: [
                               Icon(
                                 Icons.send,
                               ),

                             ],
                           )),
                     ),

                  ],
                ))
          ],
        ),
      ),
    );
  }
  sendtoauthor(String Thought){
    CollectionReference ref_thought= FirebaseFirestore.instance.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Thoughts");
    var data={
      'Thought':Thought,
      'Thought_Time':DateTime.now(),
    };
    ref_thought.add(data).then((value) => {
      Fluttertoast.showToast(msg: "Published to Praveen Kumar"),
    });
  }
}
