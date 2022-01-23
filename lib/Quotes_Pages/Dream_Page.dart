import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Dream extends StatefulWidget {
  const Dream({Key? key}) : super(key: key);

  @override
  _DreamState createState() => _DreamState();
}

class _DreamState extends State<Dream> {

  List<Trust_Class> Show_It=[

    Trust_Class(quote:"The future belongs to those who believe in the beauty of their dreams",author:"~leanor Roosevelt"),
    Trust_Class(quote:"Hope lies in dreams, in imagination, and in the courage of those who dare to make dreams into reality",author:"~Jonas Salk"),
    Trust_Class(quote:"Nothing happens unless first we dream",author:"~Carl Sandburg"),
    Trust_Class(quote:"Dreams don’t work unless you do.",author:"~John C. Maxwell "),
    Trust_Class(quote:"You are never given a dream without also being given the power to make it come true. You will have to work for it, however",author:"~Richard Bach"),
    Trust_Class(quote:"The only limit to the height of your achievements is the reach of your dreams and the willingness to work hard for them.",author:" ~Michelle Obama"),
    Trust_Class(quote:"If your dreams don’t scare you, they are too small.",author:"~Richard Branson"),
    Trust_Class(quote:"A dream doesn’t become reality through magic; it takes sweat, determination, and hard work",author:"~Colin Powell"),
    Trust_Class(quote:"Follow your dreams, they know the way.",author:"~Kobe Yamada"),
    Trust_Class(quote:"Without dreams, there can be no courage. And without courage, there can be no action.",author:"~Wim Wenders"),
    Trust_Class(quote:"It may be that those who do most, dream most.",author:"~Stephen Butler Leacock"),
    Trust_Class(quote:"Dream big. Start small. But most of all start.",author:"~Simon Sinek"),
    Trust_Class(quote:"Dream as if you’ll live forever, live as if you’ll die today",author:"~James Dean"),
    Trust_Class(quote:" Life without dreams is like a bird with a broken wing – it can’t fly",author:" ~Dan Peña"),
    Trust_Class(quote:"When you stop having dreams and ideals – well, you might as well stop altogether",author:"~Marian Anderson"),
    Trust_Class(quote:"The only thing that will stop you from fulfilling your dreams is you.",author:"~Tom Bradley"),
    Trust_Class(quote:"You’ve got to follow that dream, wherever that dream may lead.",author:" ~Elvis Presley"),
    Trust_Class(quote:"The only dreams that come true are the ones you chase, if you do nothing, you get nothing.",author:"~Joseph Atser"),
    Trust_Class(quote:"Dream no small dreams for they have no power to move the hearts of men.",author:"~Johann Wolfgang von Goethe"),
    Trust_Class(quote:"Never give up on a dream just because of the time it will take to accomplish it. The time will pass anyway.",author:"~Earl Nightingale"),
    Trust_Class(quote:"20 years from now you will be more disappointed by the things that you didn’t do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails. Explore. Dream. Discover.",author:"~Mark Twain"),
    Trust_Class(quote:"“Every morning you have two choices: continue to sleep with your dreams, or wake up and chase them.",author:"~Anonymus"),
    Trust_Class(quote:"If you don’t have a dream, how are you going to make a dream come true?.",author:"~Oscar Hammerstein"),
    Trust_Class(quote:"No dreamer is ever too small; no dream is ever too big.",author:"~Anonymus"),
    Trust_Class(quote:"No one has ever achieved anything from the smallest to the greatest unless the dream was dreamed first.",author:"~Laura Ingalls Wilder"),
    Trust_Class(quote:"If you can dream it, you can do it.",author:"~Walt Disney"),
    Trust_Class(quote:"You are never too old to set another goal or to dream a new dream",author:"~C.S. Lewis"),
    Trust_Class(quote:"A dream you dream alone is only a dream. A dream you dream together is reality.",author:"~John Lennon"),
    Trust_Class(quote:"Every great dream begins with a dreamer. Always remember, you have within you the strength, the patience, and the passion to reach for the stars to change the world.",author:"~Harriet Tubman"),
    Trust_Class(quote:"Hold fast to dreams, for if dreams die, life is a broken-winged bird that cannot fly.",author:"~Langston Hughes"),
    Trust_Class(quote:"Dreams are renewable. No matter what our age or condition, there are still untapped possibilities within us and new beauty waiting to be born.",author:"~Dale Turner"),
    Trust_Class(quote:"No matter where you’re from, your dreams are valid",author:"~Lupita Nyong’o"),
    Trust_Class(quote:"Why should you continue going after your dreams? Because seeing the look on the faces of the people who said you couldn’t… will be priceless.",author:"~Kevin Ngo"),
    Trust_Class(quote:"Dreams come true. Without that possibility, nature would not incite us to have them.",author:" ~John Updike"),
    Trust_Class(quote:"The biggest adventure you can take is to live the life of your dreams.",author:"~Oprah Winfrey"),
    Trust_Class(quote:"Don’t tell people your dreams. Show them.",author:"~ Anonymus"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dream Quotes',
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
                                      style: GoogleFonts.aclonica(color: Colors.white),
                                    ),
                                  ),
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
