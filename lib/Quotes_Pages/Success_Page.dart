import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  List<Trust_Class> Show_It=[
    Trust_Class(quote:"Success is not final; failure is not fatal: It is the courage to continue that counts.",author:"~Winston S. Churchill"),
    Trust_Class(quote:"Success is a journey, not a destination.",author:"~Arthur Ashe"),
    Trust_Class(quote:"Success is where preparation and opportunity meet.",author:"~Bobby Unser"),
    Trust_Class(quote:"Success is how high you bounce when you hit bottom",author:"~Gen. George Patton"),
    Trust_Class(quote:"Success is the progressive realization of predetermined, worthwhile, personal goals.",author:"~Paul J. Meyer"),
    Trust_Class(quote:"Success is walking from failure to failure with no loss of enthusiasm.",author:"~Winston Churchill"),
    Trust_Class(quote:"When it comes to success, there are no shortcuts.",author:"~Bo Bennett"),
    Trust_Class(quote:"I never dreamed about success, I worked for it.",author:"~Estée Lauder"),
    Trust_Class(quote:"Success is not in what you have, but who you are.",author:"~Bo Bennett"),
    Trust_Class(quote:"Success is liking yourself, liking what you do, and liking how you do it.",author:"~Maya Angelou"),
    Trust_Class(quote:"If you want to live a happy life, tie it to a goal, not to people or things.",author:"~Albert Einstein"),
    Trust_Class(quote:"The only place success comes before work is in the dictionary.",author:"~Vince Lombardi"),
    Trust_Class(quote:"A man is a success if he gets up in the morning and gets to bed at night, and in between he does what he wants to do.",author:"~Bob Dylan"),
    Trust_Class(quote:"uccess usually comes to those who are too busy to be looking for it.",author:"~Henry David Thoreau"),
    Trust_Class(quote:"Success is not final; failure is not fatal: It is the courage to continue that counts.",author:"~Winston Churchill"),
    Trust_Class(quote:"Don’t be distracted by criticism. Remember — the only taste of success some people get is to take a bite out of you.",author:"~Zig Ziglar"),
    Trust_Class(quote:"Success seems to be connected with action. Successful people keep moving. They make mistakes but they don’t quit.",author:"~Conrad Hilton"),
    Trust_Class(quote:"You know you are on the road to success if you would do your job and not be paid for it.",author:"~Oprah Winfrey"),
    Trust_Class(quote:"Success in business requires training and discipline and hard work. But if you’re not frightened by these things, the opportunities are just as great today as they ever were.",author:"~David Rockefeller"),
    Trust_Class(quote:"Before anything else, preparation is the key to success.",author:"~Alexander Graham Bell"),
    Trust_Class(quote:"The key to success is to develop a winning edge.",author:"~Brian Tracy"),
    Trust_Class(quote:"You’ll never achieve real success unless you like what you’re doing.",author:"~Dale Carnegie"),
    Trust_Class(quote:"Success is a matter of sticking to a set of common sense principles anyone can master.",author:"~Earl Nightingale"),
    Trust_Class(quote:"here is only one success – to be able to spend your life in your own way.",author:"~Christopher Morley"),
    Trust_Class(quote:"If you want to be successful, find out what the price is and then pay it.",author:"~Scott Adam"),
    Trust_Class(quote:"Behind every successful man there’s a lot of unsuccessful years.",author:"~Bob Brown"),
    Trust_Class(quote:"Living our life deeply and with happiness, having time to care for our loved ones – this is another kind of success, another kind of power, and it is much more important.",author:"~Thich Nhat Hanh"),
    Trust_Class(quote:"The maximum success is reached when you are never busy.",author:"~Nassim Nicholas Taleb"),
    Trust_Class(quote:"You have reached the pinnacle of success as soon as you become uninterested in money, compliments, or publicity.",author:"~Thomas Wolfe"),
    Trust_Class(quote:"The secret to success is to know something nobody else knows.",author:"~Aristotle Onassis"),
    Trust_Class(quote:"Success is a science; if you have the conditions, you get the result.",author:"~Oscar Wilde"),
    Trust_Class(quote:"Success is nothing more than a few simple disciplines, practiced every day.",author:"~Jim Rohn"),
    Trust_Class(quote:"Success comes from knowing that you did your best to become the best that you are capable of becoming.",author:"~John Wooden"),
    Trust_Class(quote:"Success is the progressive realization of a worthy goal or ideal.",author:"~Earl Nightingale"),
    Trust_Class(quote:"If you have no critics you’ll likely have no success.",author:"~Malcolm X"),
    Trust_Class(quote:"ry not to become a man of success, but a man of value.",author:"~Albert Einstein"),
    Trust_Class(quote:" do not pray for success, I ask for faithfulness.",author:"~Mother Teresa"),
    Trust_Class(quote:"Many of life’s failures are people who did not realize how close they were to success when they gave up.",author:"~Thomas Edison"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Quotes',
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
      ),
      backgroundColor: Colors.white70,
    );
  }
}
