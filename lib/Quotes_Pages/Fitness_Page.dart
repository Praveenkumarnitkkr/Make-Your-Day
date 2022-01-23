import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Fitness extends StatefulWidget {
  const Fitness({Key? key}) : super(key: key);
  @override
  _FitnessState createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  List<Trust_Class> Show_It=[
  Trust_Class(quote:"The only person you are destined to become is the person you decide to be.",author:"~Ralph Waldo Emerson"),
  Trust_Class(quote:"Once you learn to quit, it becomes a habit",author:"~Vince Lombardi Jr"),
  Trust_Class(quote:"A year from now you may wish you had started today.",author:"~Karen Lamb"),
  Trust_Class(quote:"¨Our growing softness, our increasing lack of physical fitness, is a menace to our security",author:"~John F. Kennedy"),
  Trust_Class(quote:"The last three or four reps is what makes the muscle grow. This area of pain divides a champion from someone who is not a champion.",author:"~Arnold Schwarzenegger"),
  Trust_Class(quote:"Most people fail, not because of lack of desire, but, because of lack of commitment",author:"~Vince Lombardi"),
  Trust_Class(quote:"Exercise is labor without weariness.",author:"~Samuel Johnson"),
  Trust_Class(quote:"The first time I see a jogger smiling, I’ll consider it.",author:"~Joan Rivers"),
  Trust_Class(quote:"Look in the mirror. That’s your competition",author:"~John Assaraf"),
  Trust_Class(quote:"Tough times don’t last. Tough people do",author:"~Robert H. Schuller"),
  Trust_Class(quote:"A feeble body weakens the mind.",author:"~Jean-Jacques Rousseau"),
  Trust_Class(quote:"Bodybuilding is much like any other sport. To be successful, you must dedicate yourself 100% to your training, diet and mental approach",author:"~Arnold Schwarzenegger"),
  Trust_Class(quote:"The groundwork for all happiness is good health.",author:"~Leigh Hunt"),
  Trust_Class(quote:"The human body is the best picture of the human soul.",author:"~Ludwig Wittgenstein"),
  Trust_Class(quote:"Our bodies are our gardens – our wills are our gardeners",author:"~William Shakespeare"),
  Trust_Class(quote:"The clock is ticking. Are you becoming the person you want to be?",author:"~Greg Plitt"),
  Trust_Class(quote:"Reading is to the mind what exercise is to the body",author:"~Joseph Addison"),
  Trust_Class(quote:"¨Exercise is king. Nutrition is queen. Put them together and you’ve got a kingdom.",author:"~Jack LaLanne"),
  Trust_Class(quote:"Success is what comes after your stop making excuses",author:"~Luis Galarza"),
  Trust_Class(quote:"The successful warrior is the average man, with laser-like focus",author:"~bruce Lee"),
  Trust_Class(quote:"Discipline is the bridge between goals and accomplishment.",author:"~Jim Rohn"),
  Trust_Class(quote:"You must expect great things of yourself before you can do them",author:"~Michael Jordan"),
  Trust_Class(quote:"The pain you feel today will be the strength you feel tomorrow.",author:"~Arnold Schwarzenegger"),
  Trust_Class(quote:"Action is the foundational key to all success.",author:"~Pablo Picasso"),
  Trust_Class(quote:"Your body is the church where Nature asks to be reverenced",author:"~Marquis de Sade"),
  Trust_Class(quote:"Things may come to those who wait, but only the things left by those who hustle",author:"~Abraham Lincoln"),
  Trust_Class(quote:"Get comfortable with being uncomfortable!",author:"~Jillian Michaels"),
  Trust_Class(quote:"Great works are performed, not by strength, but by perseverance.",author:"~Samuel Johnson"),
  Trust_Class(quote:"A champion is someone who gets up when they can’t",author:"~Jack Dempsey"),
  Trust_Class(quote:"The purpose of training is to tighten up the slack, toughen the body, and polish the spirit",author:"~Morihei Ueshiba"),
  Trust_Class(quote:"Today I will do what others won’t, so tomorrow I can accomplish what others can’t.",author:"~Jerry Rice"),
  Trust_Class(quote:"Confidence comes from discipline and training",author:"~Robert Kiyosaki"),
  Trust_Class(quote:"You have to think it before you can do it. The mind is what makes it all possible.",author:"~Kai Greene"),
  Trust_Class(quote:"We are what we repeatedly do. Excellence then is not an act but a habit.",author:"~Aristotle"),
  Trust_Class(quote:"No pain, no gain",author:"~unknown"),
  Trust_Class(quote:"You miss 100% of the shots you don’t take.",author:"~Wayne Gretzky"),
  Trust_Class(quote:"You must do the thing you think you cannot do.",author:"~Eleanor Roosevelt"),
  Trust_Class(quote:"The difference between the impossible and the possible lies in a person’s determination.",author:"~Tommy Lasorda"),
  Trust_Class(quote:"If you want something you’ve never had, you must be willing to do something you’ve never done.",author:"~Thomas Jefferson"),
  Trust_Class(quote:"One isn’t necessarily born with courage, but one is born with potential",author:"~Maya Angelou"),
  Trust_Class(quote:"You shall gain, but you shall pay with sweat, blood, and vomit",author:"~Pavel Tsatsouline"),
  Trust_Class(quote:"To give anything less than your best is to sacrifice the gift",author:"~Steve Prefontaine"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Quotes',style: GoogleFonts.balooBhai(
          letterSpacing:1,
          wordSpacing: 4
        ),),
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
                return AnimationConfiguration.staggeredList(
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
                                    Colors.lightBlueAccent,Colors.yellowAccent,
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
