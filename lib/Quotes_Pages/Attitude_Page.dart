import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';
import 'package:clipboard/clipboard.dart';
class Attitude extends StatefulWidget {
  const Attitude({Key? key}) : super(key: key);
  @override
  _AttitudeState createState() => _AttitudeState();
}
class _AttitudeState extends State<Attitude> {
  List<Trust_Class> Show_It=[
    Trust_Class(quote:"The greatest discovery of all the time is that a person can change his future by merely changing his attitude",author:"~Marie Osmond"),
    Trust_Class(quote:"Nurture your mind with great thoughts, for you will never go any higher than you think.",author:  "~Benjamin Disraeli"),
    Trust_Class(quote:"To be a great champion you must believe you are the best. If you’re not, pretend you are",author: "~Muhammad Ali"),
    Trust_Class(quote:"The greatest discovery of all the time is that a person can change his future by merely changing his attitude",author: "~Marie Osmond"),
    Trust_Class(quote:"The greatest discovery of all the time is that a person can change his future by merely changing his attitude",author: "~Marie Osmond"),
    Trust_Class(quote:"Keep a positive attitude, even if results don’t seem to be occurring as quickly as you want them to.",author: "~James Thomson"),
    Trust_Class(quote:"Being what most people think is realistic is only a way of justifying negative thinking. Go for something great",author:  "~Dr. Bob Rotella"),
    Trust_Class(quote:"Count your blessings. Focus on what you’ve got. Spread the positive vibes.",author: "~Joyti Patel"),
    Trust_Class(quote:"No one else makes us angry. We make ourselves angry when we surrender control of our attitude.",author: "~Jim Rohn"),
    Trust_Class(quote:"You always pass failure on the way to success",author: "~Mikey Rooney"),
    Trust_Class(quote:"Everyone has his burden. What counts is how you carry it.",author: " ~Miller"),
    Trust_Class(quote:"A truly happy person is one who can enjoy the scenery while on a detour.",author: "~Unknown"),
    Trust_Class(quote:"A truly happy person is one who can enjoy the scenery while on a detour.",author: "~Unknown"),
    Trust_Class(quote:"Hard work keeps the wrinkles out of the mind and spirit",author:  "~Helena"),
    Trust_Class(quote:"Sometimes it takes a wrong turn to get you to the right place.",author: "~Mandy Hale"),
    Trust_Class(quote:"All your dreams can come true f you have the courage to purse them.",author: "~Walt Disney"),
    Trust_Class(quote:"A positive attitude may not solve all your problems, but it will annoy enough people to make it worth the effort.",author: "~Herm Albright"),
    Trust_Class(quote:"If you don’t like something, change it. If you can’t change it, change your attitude.",author:  "~ Maya Angelou"),
    Trust_Class(quote:"The only disability in life is a bad attitude.", author: "~Scott Hamilton,~Dale carnegie"),
    Trust_Class(quote:"A strong positive attitude will create more miracles than any wonder drug.",author: "~Patricia Neal"),
    Trust_Class(quote:"Keep your face always toward the sunshine —and shadows will fall behind you",author:  "~Walt Whitman"),
    Trust_Class(quote:"It makes a big difference in your life when you stay positive.",author: "~Ellen ")

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attitude Quotes',
        style: GoogleFonts.balooBhai()),
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
                                    Colors.lightBlueAccent,
                                    Colors.yellowAccent,
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
                                      style: GoogleFonts.aclonica(
                                        color: Colors.white,
                                      ),
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
