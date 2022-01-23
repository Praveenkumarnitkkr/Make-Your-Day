import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {


  List<Trust_Class> Show_It=[


    Trust_Class(quote:"The two most powerful warriors are patience and time",author:"~Leo Tolstoy"),
    Trust_Class(quote:"Time is what we want most, but what we use worst",author:"~William Penn"),
    Trust_Class(quote:"All we have to decide is what to do with the time that is given us.",author: "~J.R.R. Tolkien"),
    Trust_Class(quote:"The most precious resource we all have is time.",author:"~Steve Jobs"),
    Trust_Class(quote:"Time has a wonderful way of showing us what really matters",author:"~Margaret Peters"),
    Trust_Class(quote:"Time is a created thing. To say ‘I don’t have time’ is to say ‘I don’t want to",author:"~Lao Tzu"),
    Trust_Class(quote:"No man goes before his time. Unless the boss leaves early.",author:"~Groucho Marx"),
    Trust_Class(quote:"The bad news is time flies. The good news is you’re the pilot.",author:"~Michael Altshuler"),
    Trust_Class(quote:"There’s only one thing more precious than our time and that’s who we spend it on.",author:"~Leo Christopher"),
    Trust_Class(quote:"An inch of time is an inch of gold, but you can’t buy that inch of time with an inch of gold",author:"~Chinese Proverb"),
    Trust_Class(quote:"There’s never enough time to do it right, but there’s always enough time to do it over",author:"~Jack Bergman"),
    Trust_Class(quote:"A man who dares to waste an hour of time has not discovered the value of life.",author:"~Charles Darwin"),
    Trust_Class(quote:"Time isn’t the main thing. It’s the only thing.",author:"~Miles Davis"),
    Trust_Class(quote:"I am not particularly interested in saving time; I prefer to enjoy it",author:"~Eduardo Galeano"),
    Trust_Class(quote:"Time flies over us, but leaves its shadow behind",author:"~Nathaniel Hawthorne"),
    Trust_Class(quote:"Time is what keeps everything from happening at once",author:"~Ray Cummings"),
    Trust_Class(quote:"“It’s not that we have little time, but more that we waste a good deal of it.",author:"~Seneca"),
    Trust_Class(quote:"I wish I could turn back the clock and find you sooner so I can love you longer.",author:"~Unknown"),
    Trust_Class(quote:"ime moves slowly, but passes quickly",author:"~Alice Walker"),
    Trust_Class(quote:"You will never find time for anything. If you want time, you must make it.",author:"~Charles Buxton"),
    Trust_Class(quote:"There’s never enough time to do all the nothing you want.",author:"~Calvin and Hobbes"),
    Trust_Class(quote:"Time is a waste of money",author:"~Oscar Wilde"),
    Trust_Class(quote:"Time is a great healer, but a poor beautician.",author:"~Lucille S. Harper"),
    Trust_Class(quote:"No measure of time with you will be long enough. But let’s start with forever.",author:"~Stephenie Meyer"),
    Trust_Class(quote:"You can’t turn back the clock. But you can wind it up again",author:"~Bonnie Prudden"),
    Trust_Class(quote:"Time and tide wait for no man, but time always stands still for a woman of 30",author:"~Robert Frost"),
    Trust_Class(quote:"Time has no meaning when you’re in love",author:"~Unknown"),
    Trust_Class(quote:"Better three hours too soon than one minute too late",author:"~William"),
    Trust_Class(quote:"There is never a time or place for true love. It happens accidentally, in a heartbeat, in a single flashing, throbbing moment",author:"~Sarah Dessen"),
    Trust_Class(quote:"There is a time for work and a time for love. That leaves no other time",author:"~Coco Chanel"),
    Trust_Class(quote:"Time is the longest distance between two places",author:"~Tennessee Williams,"),
    Trust_Class(quote:"To live is so startling, it leaves little time for anything else.",author:"~Emily Dickinson"),
    Trust_Class(quote:"Lost time is never found again",author:"~Benjamin Franklin"),
    Trust_Class(quote:"he only reason for time is so that everything doesn’t happen at once",author:"~Albert Einstein"),
    Trust_Class(quote:"Time you enjoy wasted was not time wasted.",author:"~John Lennon"),
    Trust_Class(quote:"Time is precious. Make sure you spend it with the right people.",author:"~Unknown"),
    Trust_Class(quote:"Who controls the past, controls the future: who controls the present controls the past.",author:"~George Orwell,"),
    Trust_Class(quote:"“Time, which changes people, does not alter the image we have of them.",author:"~Marcel Proust"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Quotes',
        style: GoogleFonts.balooBhai(  letterSpacing:1,
            wordSpacing: 4),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.yellowAccent,
                    Colors.blueAccent,

                  ]
              )
          ),
        ),
      ),
      body: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
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
                                      Colors.lightBlueAccent, Colors.yellowAccent,
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
      ),
      backgroundColor: Colors.white70,
    );
  }
}
