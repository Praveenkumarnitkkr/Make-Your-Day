import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Leadership extends StatefulWidget {
  const Leadership({Key? key}) : super(key: key);

  @override
  _LeadershipState createState() => _LeadershipState();
}

class _LeadershipState extends State<Leadership> {

  List<Trust_Class> Show_It=[
    Trust_Class(quote:"The first responsibility of a leader is to define reality. The last is to say thank you. In between, the leader is a servant.",author:"~Max DePree"),
    Trust_Class(quote:" Leadership is the capacityNapoleon Bonaparte to translate vision into reality.",author:"~Warren Bennis"),
    Trust_Class(quote:"Lead me, follow me, or get out of my way",author:"~General George Patton"),
    Trust_Class(quote:"Before you are a leader, success is all about growing yourself. When you become a leader, success is all about growing others.",author:"~Jack Welch"),
    Trust_Class(quote:"A leader is a dealer in hope",author:"~Napoleon Bonaparte"),
    Trust_Class(quote:"You don’t need a title to be a leader",author:"~Multiple Attributions"),
    Trust_Class(quote:"A leader is one who knows the way, goes the way, and shows the way.",author:"~John Maxwell"),
    Trust_Class(quote:" Leadership is lifting a person's vision to high sights, the raising of a person's performance to a higher standard, the building of a personality beyond its normal limitations. ",author:"~Peter Drucker"),
    Trust_Class(quote:" Never doubt that a small group of thoughtful, concerned citizens can change world. Indeed it is the only thing that ever has",author:"~Margaret Mead"),
    Trust_Class(quote:"The nation will find it very hard to look up to the leaders who are keeping their ears to the ground",author:"~Sir Winston Churchill"),
    Trust_Class(quote:"The most dangerous leadership myth is that leaders are born-that there is a genetic factor to leadership. That's nonsense; in fact, the opposite is true. Leaders are made rather than born.",author:"~Warren Bennis"),
    Trust_Class(quote:" To command is to serve, nothing more and nothing less. ",author:"~Andre Malraux"),
    Trust_Class(quote:"He who has never learned to obey cannot be a good commander. ",author:"~Aristotle"),
    Trust_Class(quote:" Become the kind of leader that people would follow voluntarily; even if you had no title or position.",author:"~Brian Tracy"),
    Trust_Class(quote:"I start with the premise that the function of leadership is to produce more leaders, not more followers.",author:"~Ralph Nader"),
    Trust_Class(quote:"Effective leadership is not about making speeches or being liked; leadership is defined by results not attributes",author:"~Peter Drucker"),
    Trust_Class(quote:"Anyone can hold the helm when the sea is calm. ",author:"~Publilius Syrus"),
    Trust_Class(quote:" A great person attracts great people and knows how to hold them together.",author:"~Johann Wolfgang Von Goethe"),
    Trust_Class(quote:"Leadership is influence",author:"~John C. Maxwell"),
    Trust_Class(quote:"You don't lead by pointing and telling people some place to go. You lead by going to that place and making a case. ",author:"~Ken Kesey"),
    Trust_Class(quote:" When I give a minister an order, I leave it to him to find the means to carry it out",author:"~Napoleon Bonaparte"),
    Trust_Class(quote:"Men make history and not the other way around. In periods where there is no leadership, society stands still. Progress occurs when courageous, skillful leaders seize the opportunity to change things for the better.",author:"~Harry S. Truman"),
    Trust_Class(quote:" People buy into the leader before they buy into the vision. ",author:"~John Maxwell"),
    Trust_Class(quote:"So much of what we call management consists in making it difficult for people to work",author:"~Peter Drucker"),
    Trust_Class(quote:"The art of leadership is saying no, not saying yes. It is very easy to say yes. ",author:"~Tony Blair"),
    Trust_Class(quote:"The key to successful leadership today is influence, not authority.",author:"~Kenneth Blanchard"),
    Trust_Class(quote:"A good general not only sees the way to victory; he also knows when victory is impossible.",author:"~Polybius"),
    Trust_Class(quote:"A great leader's courage to fulfill his vision comes from passion, not position.",author:"~John Maxwell"),
    Trust_Class(quote:"A leader takes people where they want to go. A great leader takes people where they don't necessarily want to go, but ought to be",author:"~Rosalynn Carter"),
    Trust_Class(quote:"The challenge of leadership is to be strong, but not rude; be kind, but not weak; be bold, but not bully; be thoughtful, but not lazy; be humble, but not timid; be proud, but not arrogant; have humor, but without folly.",author:"~Jim Rohn"),
    Trust_Class(quote:"utstanding leaders go out of their way to boost the self-esteem of their personnel. If people believe in themselves, it's amazing what they can accomplish.",author:"~Sam Walton"),
    Trust_Class(quote:"A ruler should be slow to punish and swift to reward. ",author:"~Ovid"),
    Trust_Class(quote:". No man will make a great leader who wants to do it all himself, or to get all the credit for doing it.",author:"~Andrew Carnegie"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leadership Quotes',style: GoogleFonts.balooBhai(),),
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
                  duration: Duration(seconds:1),
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
                                    Colors.lightBlueAccent,   Colors.yellowAccent,
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
                                      style: GoogleFonts.aclonica(color: Colors.white),
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
