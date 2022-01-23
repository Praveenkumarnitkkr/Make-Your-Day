import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';


class Insipirational extends StatefulWidget {
  const Insipirational({Key? key}) : super(key: key);

  @override
  _InsipirationalState createState() => _InsipirationalState();
}

class _InsipirationalState extends State<Insipirational> {

  List<Trust_Class> Show_It=[

    Trust_Class(quote:"When you have a dream, youâ€™ve got to grab it and never let go",author:"~Carol Burnett"),
    Trust_Class(quote:"Nothing is impossible. The word itself says â€˜Iâ€™m possible!",author:"~Audrey Hepburn"),
    Trust_Class(quote:"There is nothing impossible to they who will try.",author:"~Alexander the Great"),
    Trust_Class(quote:"The bad news is time flies. The good news is youâ€™re the pilot.",author:"~Michael Altshuler"),
    Trust_Class(quote:"Life has got all those twists and turns. Youâ€™ve got to hold on tight and off you go",author:"~Nicole Kidman"),
    Trust_Class(quote:"You make a choice: continue living your life feeling muddled in this abyss of self-misunderstanding, or you find your identity independent of it. You draw your own box.",author:"~Duchess Meghan"),
    Trust_Class(quote:"Success is not final, failure is not fatal: it is the courage to continue that counts",author:"~Winston Churchill"),
    Trust_Class(quote:"You define your own life. Donâ€™t let other people write your script.",author:"~Oprah Winfrey"),
    Trust_Class(quote:"You are never too old to set another goal or to dream a new dream.",author:"~Malala Yousafzai"),
    Trust_Class(quote:"At the end of the day, whether or not those people are comfortable with how youâ€™re living your life doesnâ€™t matter. What matters is whether youâ€™re comfortable with it",author:"~Dr. Phil"),
    Trust_Class(quote:"People tell you the world looks a certain way. Parents tell you how to think. Schools tell you how to think. TV. Religion. And then at a certain point, if youâ€™re lucky, you realize you can make up your own mind. Nobody sets the rules but you. You can design your own life.",author:"~Carrie Ann Moss"),
    Trust_Class(quote:"For me, becoming isnâ€™t about arriving somewhere or achieving a certain aim. I see it instead as forward motion, a means of evolving, a way to reach continuously toward a better self. The journey doesnâ€™t end.",author:"~Michelle Obama"),
    Trust_Class(quote:"Spread love everywhere you go.",author:"~Mother Teresa"),
    Trust_Class(quote:"Do not allow people to dim your shine because they are blinded. Tell them to put some sunglasses on.",author:"~Lady Gaga"),
    Trust_Class(quote:"If you make your internal life a priority, then everything else you need on the outside will be given to you and it will be extremely clear what the next step is.",author:"~Gabrielle Bernstein"),
    Trust_Class(quote:"You donâ€™t always need a plan. Sometimes you just need to breathe, trust, let go and see what happens.",author:"~Mandy Hale"),
    Trust_Class(quote:"You can be everything. You can be the infinite amount of things that people are",author:"~Kesha"),
    Trust_Class(quote:"What lies behind you and what lies in front of you, pales in comparison to what lies inside of you.",author:"~Ralph Waldo Emerson"),
    Trust_Class(quote:"Belief creates the actual fact",author:"~William James"),
    Trust_Class(quote:"No matter what people tell you, words and ideas can change the world.",author:"~Robin Williams "),
    Trust_Class(quote:"Iâ€™m not going to continue knocking that old door that doesnâ€™t open for me. Iâ€™m going to create my own door and walk through that.",author:"~Ava DuVernay"),
    Trust_Class(quote:"It is during our darkest moments that we must focus to see the light.",author:"~Aristotle"),
    Trust_Class(quote:"Not having the best situation, but seeing the best in your situation is the key to happiness.",author:"~Marie Forleo"),
    Trust_Class(quote:"Weaknesses are just strengths in the wrong environment.",author:"~Marianne Cantwell"),
    Trust_Class(quote:"Just don’t give up trying to do what you really want to do. Where there is love and inspiration, I don’t think you can go wrong",author:"~Ella Fitzgerald"),
    Trust_Class(quote:"Silence is the last thing the world will ever hear from me.",author:"~Marlee Matlin"),
    Trust_Class(quote:"Learning how to be still, to really be still and let life happen—that stillness becomes a radiance",author:"~Morgan Freeman"),
    Trust_Class(quote:"Everyone has inside of him a piece of good news. The good news is that you don’t know how great you can be! How much you can love! What you can accomplish! And what your potential is!",author:"~Anne Frank")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insipirational Quotes',style: GoogleFonts.balooBhai(),),
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
