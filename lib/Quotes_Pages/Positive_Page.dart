import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Positive extends StatefulWidget {
  const Positive({Key? key}) : super(key: key);

  @override
  _PositiveState createState() => _PositiveState();
}

class _PositiveState extends State<Positive> {

  List<Trust_Class> Show_It=[


    Trust_Class(quote:"Keep your face always toward the sunshine—and shadows will fall behind you.",author:"~Walt Whitman"),
    Trust_Class(quote:"Extraordinary things are always hiding in places people never think to look",author:"~Jodi Picoul"),
    Trust_Class(quote:"Say something positive, and you’ll see something positive",author:"~Jim Thompson"),
    Trust_Class(quote:"All you need is the plan, the road map, and the courage to press on to your destination.",author:"~Earl Nightingale"),
    Trust_Class(quote:"Train your mind to see the good in every situation.",author:"~Unknown"),
    Trust_Class(quote:"If you can stay positive in a negative situation, you win",author:"~Unknown"),
    Trust_Class(quote:"Stay positive. Better days are on their way",author:"~Unknown"),
    Trust_Class(quote:"Only in the darkness can you see the stars.",author:"~Martin Luther King, Jr."),
    Trust_Class(quote:"In a gentle way, you can shake the world.",author:"~Mahatma Gandhi"),
    Trust_Class(quote:"Positive anything is better than negative nothing.",author:"~Elbert Hubbard"),
    Trust_Class(quote:"Miracles happen to those who believe in them.",author:"~Bernhard Berenson"),
    Trust_Class(quote:"One small positive thought can change your whole day.",author:"~Zig Ziglar"),
    Trust_Class(quote:"Believe you can and you’re halfway there.",author:"~Teddy Roosevelt"),
    Trust_Class(quote:"Be positive. Be true. Be kind.",author:"~Roy T. Bennett"),
    Trust_Class(quote:"ou cannot have a positive life and a negative mind.",author:"~Joyce Meyer"),
    Trust_Class(quote:"If you are positive, you’ll see opportunities instead of obstacles.",author:"~Widad Akrawi"),
    Trust_Class(quote:"Write it on your heart that every day is the best day in the year.",author:"~Ralph Waldo Emerson"),
    Trust_Class(quote:"Accentuate the positive, Eliminate the Negative, latch onto the affirmative.",author:"~Bing Crosby"),
    Trust_Class(quote:" will go anywhere as long as it’s forward.",author:"~David Livingston"),
    Trust_Class(quote:"My dear friend, clear your mind of can’t.",author:"~Samuel Johnson"),
    Trust_Class(quote:"Keep a smile on your face. Keep a spring in your step.",author:"~Joel Osteen"),
    Trust_Class(quote:"A positive atmosphere nurtures a positive attitude, which is required to take positive action.",author:"~Richard M. DeVos"),
    Trust_Class(quote:"Turn every life situation into a positive one",author:"~Rhonda Byrne"),
    Trust_Class(quote:"Believe that life is worth living and your belief will help create the fact.",author:"~William James"),
    Trust_Class(quote:"The most positive men are the most credulous.",author:"~Alexander Pope"),
    Trust_Class(quote:"Your positive action combined with positive thinking results in success.",author:"~Shiv Khera"),
    Trust_Class(quote:"Don’t focus on negative things; focus on the positive, and you will flourish.",author:"~Alek Wek"),
    Trust_Class(quote:"Inspiration comes from within yourself. One has to be positive. When you’re positive, good things happen.",author:"~Deep Roy"),
    Trust_Class(quote:"Surround yourself with positive people and you’ll be a positive person.",author:"~Kellie Pickler"),
    Trust_Class(quote:"Virtually nothing is impossible in this world if you just put your mind to it and maintain a positive attitude.",author:"~Lou Holtz"),
    Trust_Class(quote:"It’s almost always possible to be honest and positive.",author:"~Naval Ravikant"),
    Trust_Class(quote:"It’s most important that you surround yourself with positivity always, and have it in your mind at all times.",author:"~Tyler Perry"),
    Trust_Class(quote:"When you are joyful, when you say yes to life and have fun and project positivity all around you, you become a sun in the center of every constellation, and people want to be near you.",author:"~Shannon L. Alder"),
    Trust_Class(quote:"In every day, there are 1,440 minutes. That means we have 1,440 daily opportunities to make a positive impact",author:"~Les Brown"),
    Trust_Class(quote:"I surround myself with positive, productive people of good will and decency.",author:"~Ted Nugent"),
    Trust_Class(quote:"There is no advertisement as powerful as a positive reputation traveling fast.",author:"~Brian Koslow"),
    Trust_Class(quote:"The less you respond to negative people, the more positive your life will become.",author:"~Paolo Coelho"),
    Trust_Class(quote:"Change your thoughts and you change your world.",author:"~unknown"),
    Trust_Class(quote:"I believe that you should gravitate to people who are doing productive and positive things with their lives.",author:"~Nadia Comaneci"),
    Trust_Class(quote:"Dwell on the beauty of life. Watch the stars, and see yourself running with them.",author:"~Marcus Aurelius"),
    Trust_Class(quote:"The power for creating a better future is contained in the present moment: You create a good future by creating a good present.",author:"~Eckhart Tolle"),
    Trust_Class(quote:"Shoot for the moon. Even if you miss, you’ll land among the stars.",author:"~Eckhart Tolle"),
    Trust_Class(quote:"Shoot for the moon. Even if you miss, you’ll land among the stars.",author:"~Norman Vincent Peale"),
    Trust_Class(quote:"We can complain because rose bushes have thorns, or rejoice because thorns have roses.",author:"~Alphonse Karr"),
    Trust_Class(quote:"Believing in negative thoughts is the single greatest obstruction to success.",author:"~Charles F. Glassman"),
    Trust_Class(quote:"f opportunity doesn’t knock, build a door",author:"~Milton Berle"),
    Trust_Class(quote:"Every day may not be good… but there’s something good in every day.",author:"~Alice Morse Earle"),
    Trust_Class(quote:"In order to carry a positive action we must develop here a positive vision.",author:"~Dalai Lama"),
    Trust_Class(quote:"A problem is a chance for you to do your best.",author:"~Duke Ellington"),
    Trust_Class(quote:"Most of the important things in the world have been accomplished by people who have kept on trying when there seemed to be no hope at all.",author:"~Dale Carnegie"),
    Trust_Class(quote:"There are far, far better things ahead than anything we leave behind.",author:"~C.S. Lewis"),
    Trust_Class(quote:"We are all in the gutter, but some of us are looking at the stars.",author:"~Oscar Wilde"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.grey,
        title: Text('Positive Quotes',
        style: GoogleFonts.balooBhai(),),
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
      backgroundColor: Colors.white70,
    );
  }
}
