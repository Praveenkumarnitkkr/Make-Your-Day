import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';
class Trust extends StatefulWidget {
  const Trust({Key? key}) : super(key: key);
  @override
  _TrustState createState() => _TrustState();
}
class _TrustState extends State<Trust> {
  List<Trust_Class> Show_It=[
    Trust_Class(author: "~William Shakespeare",quote: "Don’t trust the person who has broken faith once"),
    Trust_Class(author: "~Lady Gaga",quote: "Trust is like a mirror, you can fix it if it’s broken, but you can still see the crack in that mother fucker’s reflection."),
    Trust_Class(author: "~Unknown",quote: "Trust takes years to build, seconds to break, and forever to repair."),
    Trust_Class(author: "~Friedrich Nietzsche",quote: "I'm not upset that you lied to me, I'm upset that from now on I can't believe you."),
    Trust_Class(author: "~J.M. Barrie, Peter Pan",quote: "All the world is made of faith, and trust, and pixie dust."),
    Trust_Class(author: "~Maya Angelou",quote: "I don't trust people who don't love themselves and tell me, 'I love you.' ... There is an African saying which is: Be careful when a naked person offers you a shirt."),
    Trust_Class(author: "~Ernest Hemingway",quote: "The best way to find out if you can trust somebody is to trust them."),
    Trust_Class(author: "~Maya Angelou",quote: "Have enough courage to trust love one more time and always one more time"),
    Trust_Class(author: "~Corrie ten Boom",quote: "Never be afraid to trust an unknown future to a known God"),
    Trust_Class(author: "~Doris Lessing",quote: "Trust no friend without faults, and love a woman, but no angel"),
    Trust_Class(author: "~David Levithan",quote: "We always see our worst selves. Our most vulnerable selves. We need someone else to get close enough to tell us we’re wrong. Someone we trust"),
    Trust_Class(author: "~J.K. Rowling",quote: "The last words Albus Dumbledore spoke to the pair of us?Harry is the best hope we have. Trust him."),
    Trust_Class(author: "~Ronald Reagan",quote: "Trust, but verify."),
    Trust_Class(author: "~Ralph Waldo Emerson",quote: "Trust thyself: every heart vibrates to that iron stringsgsdrey5ghdghdf"),
    Trust_Class(author: "~David Levithan",quote: "“It was a mistake,” you said. But the cruel thing was, it felt like the mistake was mine, for trusting you."),
    Trust_Class(author: "~Bob Vanourek",quote: "Trust is built when someone is vulnerable and not taken advantage of. "),
    Trust_Class(author: "~Evelyn Waugh",quote: "After all, damn it, what does being in love mean if you can’t trust a person."),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trust Quotes',style: GoogleFonts.balooBhai(),),
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
      body: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            padding: EdgeInsets.all(5),
              scrollDirection:Axis.vertical,
              shrinkWrap: true,
              itemCount: Show_It.length,
              itemBuilder: (context,index){
                return  AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(seconds: 1),
                  child: SlideAnimation(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    Colors.lightBlueAccent,  Colors.yellowAccent,
                                  ]
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    Show_It[index].quote.toString(),
                                    style: GoogleFonts.aclonica(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Show_It[index].author.toString(),
                                      style:GoogleFonts.aclonica(color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.50,),
                                  Row(
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          onPressed: () async{
                                            HapticFeedback.selectionClick();
                                            FlutterClipboard.copy(Show_It[index].quote.toString()).then((value) => {
                                              Fluttertoast.showToast(msg: "Copied to clipboard")
                                            });
                                          },
                                          splashRadius: 20,
                                          splashColor: Colors.yellowAccent,
                                          icon: Icon(
                                            Icons.copy,
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          onPressed: () async{
                                            HapticFeedback.lightImpact();
                                            CollectionReference ref= FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                                .collection('Favourites');
                                            var data={
                                              'Quote': Show_It[index].quote,
                                              'author': Show_It[index].author,
                                            };
                                            ref.add(data).then((value) => {
                                              Fluttertoast.showToast(msg: "Added to Favourites")
                                            });
                                          },
                                          splashRadius: 20,
                                          splashColor: Colors.redAccent,
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
