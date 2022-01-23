import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Freedom extends StatefulWidget {
  const Freedom({Key? key}) : super(key: key);

  @override
  _FreedomState createState() => _FreedomState();
}

class _FreedomState extends State<Freedom> {

  List<Trust_Class> Show_It=[
    Trust_Class(quote:"I am no bird; and no net ensnares me: I am a free human being with an independent will.",author:"~unknown"),
    Trust_Class(quote:"The truth will set you free, but first it will piss you off.",author:"~Joe Klaas"),
    Trust_Class(quote:"I am no bird; and no net ensnares me: I am a free human being with an independent will.",author:"~Charlotte Brontë"),
    Trust_Class(quote:"Lock up your libraries if you like; but there is no gate, no lock, no bolt that you can set upon the freedom of my mind",author:"~Virginia Woolf"),
    Trust_Class(quote:"he most courageous act is still to think for yourself. Aloud.",author:"~Coco Chanel"),
    Trust_Class(quote:"War is peace.Freedom is slavery.Ignorance is strength.",author:"~George Orwell,"),
    Trust_Class(quote:"ome tourists think Amsterdam is a city of sin, but in truth it is a city of freedom. And in freedom, most people find sin.",author:"~John Green,"),
    Trust_Class(quote:"Freedom is not worth having if it does not include the freedom to make mistakes.",author:"~Mahatma Gandhi"),
    Trust_Class(quote:"When a man is denied the right to live the life he believes in, he has no choice but to become an outlaw.",author:"~Nelson Mandela"),
    Trust_Class(quote:"When I discover who I am, I’ll be free",author:"~Ralph Ellison"),
    Trust_Class(quote:"People demand freedom of speech as a compensation for the freedom of thought which they seldom use",author:"~Søren Kierkegaard"),
    Trust_Class(quote:"You wanna fly, you got to give up the shit that weighs you down.",author:"~Toni Morrison"),
    Trust_Class(quote:"They who can give up essential liberty to obtain a little temporary safety deserve neither liberty nor safety.",author:"~Benjamin Franklin"),
    Trust_Class(quote:"Expose yourself to your deepest fear; after that, fear has no power, and the fear of freedom shrinks and vanishes. You are free.",author:"~Jim Morrison"),
    Trust_Class(quote:"Anxiety is the dizziness of freedom.",author:"~Søren Kierkegaard"),
    Trust_Class(quote:"Better to die fighting for freedom then be a prisoner all the days of your life.",author:"~Bob Marley"),
    Trust_Class(quote:"The truth will set you free. But not until it is finished with you.",author:"~David Foster Wallace"),
    Trust_Class(quote:"Freeing yourself was one thing, claiming ownership of that freed self was another",author:"~Toni Morrison"),
    Trust_Class(quote:"Reality doesn't impress me. I only believe in intoxication, in ecstasy, and when ordinary life shackles me, I escape, one way or another. No more walls",author:"~Anaïs Nin"),
    Trust_Class(quote:"Freedom lies in being bold.",author:"~Robert Frost"),
    Trust_Class(quote:"Now that she had nothing to lose, she was free.",author:"~Paulo Coelho"),
    Trust_Class(quote:"The unhappiest people in this world, are those who care the most about what other people think.",author:"~C. JoyBell C."),
    Trust_Class(quote:"Liberty, when it begins to take root, is a plant of rapid growth.",author:"~George Washington"),
    Trust_Class(quote:"Life without liberty is like a body without spirit",author:"~Kahlil Gibran"),
    Trust_Class(quote:"Freedom is the open window through which pours the sunlight of the human spirit and human dignity.",author:"~Herbert Hoover"),
    Trust_Class(quote:"For everything that is really great and inspiring is created by the individual who can labour in freedom.",author:"~Albert Einstein"),
    Trust_Class(quote:"For to be free is not merely to cast off one’s chains, but to live in a way that respects and enhances the freedom of others",author:"~Nelson Mandela"),
    Trust_Class(quote:"Is freedom anything else than the right to live as we wish? Nothing else.",author:"~Epictetus"),
    Trust_Class(quote:"Independence is a heady draft, and if you drink it in your youth, it can have the same effect on the brain as young wine does. It does not matter that its taste is not always appealing. It is addictive and with each drink you want more.",author:"~Maya Angelou"),
    Trust_Class(quote:"I am no bird; and no net ensnares me; I am a free human being with an independent will.",author:"~Charlotte Brontë, Jane Eyre"),
    Trust_Class(quote:"We must be free not because we claim freedom, but because we practice it.",author:"~William Faulkner"),
    Trust_Class(quote:"The only real prison is fear, and the only real freedom is freedom from fear.",author:"~Aung San Suu Kyi"),
    Trust_Class(quote:"Lock up your libraries if you like; but there is no gate, no lock, no bolt, that you can set upon the freedom of my mind.",author:"~Virginia Woolf"),
    Trust_Class(quote:"No one outside ourselves can rule us inwardly. When we know this, we become free.",author:"~Buddha"),
    Trust_Class(quote:" know but one freedom and that is the freedom of the mind",author:"~Antoine de Saint-Exupéry"),
    Trust_Class(quote:"For what avail the plough or sail, or land or life, if freedom fail?",author:"~Ralph Waldo Emerson"),
    Trust_Class(quote:"What do you suppose will satisfy the Soul, except to walk free, and own no superior?",author:"~Leaves of Grass"),
    Trust_Class(quote:"No person is your friend (or kin) who demands your silence, or denies your right to grow.",author:"~Alice Walker"),
    Trust_Class(quote:"As soon as we left the ground, I knew I myself had to fly.",author:"~Amelia Earhart"),
    Trust_Class(quote:"Tame birds sing of freedom. Wild birds fly.",author:"~attributed to John Lennon"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freedom Quotes',style: GoogleFonts.balooBhai(),),
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
