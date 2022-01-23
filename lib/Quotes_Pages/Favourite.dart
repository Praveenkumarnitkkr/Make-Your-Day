
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);
  @override
  _FavouriteState createState() => _FavouriteState();
}
class _FavouriteState extends State<Favourite> {
  CollectionReference ref= FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Favourites');
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
        title: Text('Favourites',
        style: GoogleFonts.baloo(),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.grey,
                    Colors.blueAccent,
                    Colors.grey,
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
                future:ref.get(),
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
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(seconds:1),
                              child: FlipAnimation(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.lightBlueAccent, Colors.yellowAccent,
                                              ]
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text("${data['Quote']}",   style: GoogleFonts.aclonica(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text("${data['author']}",style: GoogleFonts.aclonica(color: Colors.white),),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  child: Container(
                                                    alignment: Alignment.bottomRight,
                                                    child: IconButton(
                                                      onPressed: (){
                                                        HapticFeedback.lightImpact();
                                                        FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid)
                                                            .collection("Favourites").doc(snapshot.data?.docs[index].id).delete().then((value) => {
                                                          Fluttertoast.showToast(msg: "Successfully deleted")
                                                        });
                                                        setState(() {
                                                        });
                                                      },
                                                      splashRadius: 20,
                                                      splashColor: Colors.red,
                                                      icon: Icon(
                                                        Icons.delete_forever,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),

                                      ),
                                    )
                                  ],
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
                      child: Center(
                          child: Text("Please add your favourite quotes")
                      ),
                    );
                  }
                  else return
                      Container(
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
                          ],
                        ),
                      );
                }),
          ],
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
