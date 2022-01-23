import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Happiness extends StatefulWidget {
  const Happiness({Key? key}) : super(key: key);

  @override
  _HappinessState createState() => _HappinessState();
}

class _HappinessState extends State<Happiness> {

  List<Trust_Class> Show_It=[


    Trust_Class(quote:"The purpose of our lives is to be happy.",author:"~Dalai Lama"),
    Trust_Class(quote:"Life is what happens when you’re busy making other plans.",author:"~John Lennon"),
    Trust_Class(quote:"Get busy living or get busy dying.",author:"~Stephen King"),
    Trust_Class(quote:"You only live once, but if you do it right, once is enough",author:"~Mae West"),
    Trust_Class(quote:"Many of life’s failures are people who did not realize how close they were to success when they gave up",author:"~Thomas A. Edison"),
    Trust_Class(quote:"If you want to live a happy life, tie it to a goal, not to people or things.",author:"~Albert Einstein"),
    Trust_Class(quote:"Never let the fear of striking out keep you from playing the game",author:"~Babe Ruth"),
    Trust_Class(quote:"Money and success don’t change people; they merely amplify what is already there.",author:"~Will Smith"),
    Trust_Class(quote:"Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking",author:"~Steve Jobs"),
    Trust_Class(quote:"Not how long, but how well you have lived is the main thing.",author:"~Seneca"),
    Trust_Class(quote:"If life were predictable it would cease to be life, and be without flavor.",author:"~Eleanor Roosevelt"),
    Trust_Class(quote:"The whole secret of a successful life is to find out what is one’s destiny to do, and then do it",author:"~Henry Ford"),
    Trust_Class(quote:"In order to write about life first you must live it.",author:"~Ernest Hemingway"),
    Trust_Class(quote:"The big lesson in life, baby, is never be scared of anyone or anything",author:"~Frank Sinatra"),
    Trust_Class(quote:"Sing like no one’s listening, love like you’ve never been hurt, dance like nobody’s watching, and live like it’s heaven on earth.",author:"~Attributed to various sources"),
    Trust_Class(quote:"Curiosity about life in all of its aspects, I think, is still the secret of great creative people.",author:"~Leo Burnett"),
    Trust_Class(quote:"Life is not a problem to be solved, but a reality to be experienced",author:"~Soren Kierkegaard"),
    Trust_Class(quote:"The unexamined life is not worth living.",author:"~Socrates"),
    Trust_Class(quote:"Turn your wounds into wisdom",author:"~Oprah Winfrey"),
    Trust_Class(quote:"The way I see it, if you want the rainbow, you gotta put up with the rain.",author:"~Dolly Parton"),
    Trust_Class(quote:"Don’t settle for what life gives you; make life better and build something.",author:"~Ashton Kutcher"),
    Trust_Class(quote:"Everybody wants to be famous, but nobody wants to do the work. I live by that. You grind hard so you can play hard. At the end of the day, you put all the work in, and eventually it’ll pay off. It could be in a year, it could be in 30 years. Eventually, your hard work will pay off.",author:"~Kevin Hart"),
    Trust_Class(quote:"Everything negative – pressure, challenges – is all an opportunity for me to rise.",author:"~Kobe Bryant"),
    Trust_Class(quote:"I like criticism. It makes you strong",author:"~LeBron James"),
    Trust_Class(quote:"You never really learn much from hearing yourself speak",author:"~George Clooney"),
    Trust_Class(quote:"Life imposes things on you that you can’t control, but you still have the choice of how you’re going to live through this",author:"~Celine Dion"),
    Trust_Class(quote:"Life is never easy. There is work to be done and obligations to be met – obligations to truth, to justice, and to liberty",author:"~John F. Kennedy"),
    Trust_Class(quote:"Live for each second without hesitation",author:"~Elton John"),
    Trust_Class(quote:"Life is like riding a bicycle. To keep your balance, you must keep moving",author:"~Albert Einstein"),
    Trust_Class(quote:"Life is really simple, but men insist on making it complicated.",author:"~Confucius"),
    Trust_Class(quote:"Life is a succession of lessons which must be lived to be understood.",author:"~Helen Keller"),
    Trust_Class(quote:"My mama always said, life is like a box of chocolates. You never know what you’re gonna get",author:"~Forrest Gump"),
    Trust_Class(quote:"Watch your thoughts; they become words. Watch your words; they become actions. Watch your actions; they become habits. Watch your habits; they become character. Watch your character; it becomes your destiny",author:"~Lao-Tze"),
    Trust_Class(quote:"When we do the best we can, we never know what miracle is wrought in our life or the life of another.",author:"~Helen Keller"),
    Trust_Class(quote:"The healthiest response to life is joy",author:"~Deepak Chopra"),
    Trust_Class(quote:"Life is like a coin. You can spend it any way you wish, but you only spend it once.",author:"~Lillian Dickson"),
    Trust_Class(quote:"The best portion of a good man’s life is his little nameless, unencumbered acts of kindness and of love",author:"~Wordsworth"),
    Trust_Class(quote:"In three words I can sum up everything I’ve learned about life: It goes on",author:"~Robert Frost"),
    Trust_Class(quote:"Keep calm and carry on",author:"~Winston Churchill"),
    Trust_Class(quote:"Maybe that’s what life is… a wink of the eye and winking stars",author:"~Jack Kerouac"),
    Trust_Class(quote:"Life is a flower of which love is the honey.",author:"~Victor Hugo"),
    Trust_Class(quote:"Keep smiling, because life is a beautiful thing and there’s so much to smile about.",author:"~Marilyn Monroe"),
    Trust_Class(quote:"Good friends, good books, and a sleepy conscience: this is the ideal life",author:"~Mark Twain"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happiness Quotes',style: GoogleFonts.balooBhai(),),
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
