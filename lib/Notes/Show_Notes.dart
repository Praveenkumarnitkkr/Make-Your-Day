import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:make_your_day/Notes/Write_Notes.dart';
class Show_notes extends StatefulWidget {
  const Show_notes({Key? key}) : super(key: key);

  @override
  _Show_notesState createState() => _Show_notesState();
}

class _Show_notesState extends State<Show_notes> {

  CollectionReference ref= FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Notes');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show_Notes',style: GoogleFonts.balooBhai(),),
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
      body:SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder<QuerySnapshot>(
                future:ref.orderBy('Time',descending: true).get(),
                builder: (context,snapshot){
                  if(snapshot.hasData&&snapshot.data?.docs.length!=0){
                    return AnimationLimiter(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            Map data= snapshot.data!.docs[index].data() as Map;
                            DateTime mynote_time=data['Time'].toDate();
                            String formattedTime =
                            DateFormat.yMMMd().add_jm().format(mynote_time);
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(seconds:1),
                              child: ScaleAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient:LinearGradient(
                                        colors:<Color>[
                                          Colors.yellowAccent,
                                          Colors.lightBlueAccent,
                                        ]
                                      )
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${data['title']}",
                                              style: GoogleFonts.indieFlower(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(3, 10, 3, 1),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${data['description']}",
                                              style:GoogleFonts.dancingScript(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                                formattedTime
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    );
                  }
                  else if(snapshot.data?.docs.length==0){
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(child: Text("Please add some notes")),
                        ],
                      ),
                    );
                  }
                  else return Container(
                      width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.75,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpinKitPumpingHeart(
                          color: Colors.red,
                          size: 150,
                          duration: Duration(seconds: 2),
                        ),
                        Text("Please wait.....")
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Write_Note()));
          },
          child: Icon(
            Icons.add,
            size: 20,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Colors.white70,
    );
  }
}
