import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);

  @override
  _LifeState createState() => _LifeState();
}

class _LifeState extends State<Life> {

  List<Trust_Class> Show_It=[


    Trust_Class(quote:"Life is a gift. Never take it for granted.",author:"~Sasha Avevedo"),
    Trust_Class(quote:"Everything has its beauty, but not everyone see it.",author:"~Confucius"),
    Trust_Class(quote:"The biggest adventure you can take is to live the life of your dreams",author:"~Oprah Winfrey"),
    Trust_Class(quote:"Life is a succession of lessons which must be lived to be understood.",author:"~Ralph Waldo Emerson"),
    Trust_Class(quote:"Dwell on the beauty of life. Watch the stars, and see yourself running with them",author:"~Marcus Aurelius"),
    Trust_Class(quote:"A man who dares to waste one hour of time has not discovered the value of life.",author:"~Charles Darwin"),
    Trust_Class(quote:"Keep smiling, because life’s beautiful and there’s so much to smile about.",author:"~Marilyn Monroe"),
    Trust_Class(quote:"In the midst of winter, I found there was within me an invincible summer",author:"~Albert Camus"),
    Trust_Class(quote:"Be glad of life because it gives you the chance to love and to work and to play and look up at the stars.",author:"~Henry Van Dyke"),
    Trust_Class(quote:"Life is full of beauty. Notice it. Notice the bumble bee, the small child, and the smiling faces. Smell the rain, and feel the wind. Live your life to the fullest potential, and fight for your dreams",author:"~Ashley Smith"),
    Trust_Class(quote:"Life is abundant, and life is beautiful. And it’s a good place that we’re all in, you know, on this earth, if we take care of it.",author:"~Alice Walker"),
    Trust_Class(quote:"Slow down and enjoy life. It’s not only the scenery you miss by going to fast – you also miss the sense of where you are going and why",author:"~Eddie Cantor"),
    Trust_Class(quote:"Life is beautiful but people are crazy",author:"~Charles Osgood"),
    Trust_Class(quote:"Life is the art of drawing without an eraser",author:"~John W. Gardner"),
    Trust_Class(quote:"Live life to the fullest, and focus on the positive.",author:"~Matt Cameron"),
    Trust_Class(quote:"Because of your smile, you make life more beautiful",author:"~Thich Nhat Hanh"),
    Trust_Class(quote:"Be happy for this moment. This moment is your life",author:"~Omar Khayyam"),
    Trust_Class(quote:"Even in a world with much sadness, at its essence, life is beautiful.",author:"~Dianne Reeves"),
    Trust_Class(quote:"Very little is needed to make a happy life; it is all within yourself, in your way of thinking.",author:"~Marcus Aurelius"),
    Trust_Class(quote:"When you arise in the morning think of what a privilege it is to be alive, to breathe. To Think. To Enjoy. To Love. ",author:"~Marcus Aurelius"),
    Trust_Class(quote:"There’s a sunrise and a sunset every single day, and they’re absolutely free. Don’t miss so many of them.",author:"~Jo Walton"),
    Trust_Class(quote:"Loneliness adds beauty to life. It puts a special burn on sunsets and makes night air smell better.",author:"~Henry Rollins"),
    Trust_Class(quote:"Beauty is the illumination of your soul.",author:"~John O’Donohue"),
    Trust_Class(quote:"The very center of your heart is where life begins — the most beautiful place on earth.",author:"~Rumi"),
    Trust_Class(quote:"But the most beautiful things in life are not things. They’re people, and places, and memories, and pictures. They’re the feelings and moments and smiles and laughter.",author:"~Unknown"),
    Trust_Class(quote:"Blessed are they who see beautiful things in humble places where others see nothing.",author:"~Camille Pissaro"),
    Trust_Class(quote:"The fear of death follows from the fear of life. A man who lives fully is prepared to die at any time.",author:"~Mark Twain"),
    Trust_Class(quote:"Life is very interesting. In the end, some of your greatest pains become your greatest strengths.",author:"~Drew Barrymore"),
    Trust_Class(quote:"I find beauty in unusual things, like hanging your head out the window or sitting on a fire escape.",author:"~Scarlett Johansson"),
    Trust_Class(quote:"And, when you want something, all the universe conspires in helping you to achieve it.",author:"~Paulo Coelho, ~The Alchemist"),
    Trust_Class(quote:"Life is abundant, and life is beautiful. And it’s a good place that we’re all in, you know, on this earth, if we take care of it.",author:"~Alice Walker"),
    Trust_Class(quote:"Give every day the chance to become the most beautiful day of your life",author:"~Mark Twain"),
    Trust_Class(quote:"Love is abundance share it with your friends",author:"~Vanessa Nanthakumaran"),
    Trust_Class(quote:"Wouldn't it be a beautiful world if just 10 percent of the people who believe in the power of love would compete with one another to see who could do the most good for the most people? ",author:"~Muhammad Ali"),
    Trust_Class(quote:"Life is a mysterious mix of beautiful, challenging, and painful experiences. No one can predict how it will unfold and we don’t always understand why it unfolds the way it does",author:"~Akirah Robinson"),
    Trust_Class(quote:"Life is wide, limitless. There is no border, no frontier",author:"~Bruce Lee"),
    Trust_Class(quote:"Life is beautiful. It has many amazing surprises in store up for you.",author:"~A C Aseh"),
    Trust_Class(quote:" Humor oils the wheels of life and helps to keep it running smoothly.",author:"~Dorothea Kopplin"),
    Trust_Class(quote:"If you want your life to count, you have to focus it. You don't have time for everything, and not everything is of equal value.",author:"~Rick Warren"),
    Trust_Class(quote:"So, decide what you want in life,and don't let anyone distract you from reaching your goals and your dreams!You Can Do It!",author:"~Jerry Aragon"),
    Trust_Class(quote:" In order to achieve your end goals, it is essential to find motivation to help you along your way. Nothing great is achieved without motivation.",author:"~Brian Night"),
    Trust_Class(quote:"You'll never escape it alive anyway.",author:"~Elbert Hubbard"),
    Trust_Class(quote:"I enjoy being happy every day, and hopefully you can hear my happiness in my music. Life is beautiful.",author:"~Christina Milian"),
    Trust_Class(quote:"Nothing is the same after losing someone or something that you love greatly. And yet, in many ways, perhaps we are never more aware of what that love meant—and the preciousness of life itself—until it’s gone",author:"~Eleora Han"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Quotes',style: GoogleFonts.balooBhai(),),
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
