import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Love extends StatefulWidget {
  const Love({Key? key}) : super(key: key);

  @override
  _LoveState createState() => _LoveState();
}

class _LoveState extends State<Love> {

  List<Trust_Class> Show_It=[


    Trust_Class(quote:"In love there are two things: bodies and words.",author:"~Joyce Carol Oates"),
    Trust_Class(quote:"Continue to share your heart with people even if it has been broken.",author:"~Amy Poehler"),
    Trust_Class(quote:"Love is such a powerful force. It’s there for everyone to embrace-that kind of unconditional love for all of humankind. That is the kind of love that impels people to go into the community and try to change conditions for others, to take risks for what they believe in.",author:"~Coretta Scott King"),
    Trust_Class(quote:"To love is to recognize yourself in another.",author:"~Eckhart Tolle"),
    Trust_Class(quote:"To be fully seen by somebody, then, and be loved anyhow - this is a human offering that can border on miraculous.",author:"~Elizabeth Gilbert"),
    Trust_Class(quote:"Love isn't something natural. Rather it requires discipline, concentration, patience, faith, and the overcoming of narcissism. It isn't a feeling, it is a practice.",author:"~Eric Fromm"),
    Trust_Class(quote:"There is always some madness in love. But there is also always some reason in madness.",author:"~Friedrich Nietzsche"),
    Trust_Class(quote:"There's all kinds of reasons that you fall in love with one person rather than another: Timing is important. Proximity is important. Mystery is important.",author:"~Helen Fisher"),
    Trust_Class(quote:"Passion makes the world go 'round. Love just makes it a safer place.",author:"~Ice-T"),
    Trust_Class(quote:"I believe in love. I think it just hits you and pulls the rug out from underneath you and, like a baby, demands your attention every minute of the day.",author:"~Jodi Picoult"),
    Trust_Class(quote:"When you find that one that's right for you, you feel like they were put there for you, you never want to be apart",author:"~Joe Manganiello"),
    Trust_Class(quote:"When you're lucky enough to meet your one person, then life takes a turn for the best. It can't get better than that.",author:"~John Krasinski"),
    Trust_Class(quote:"You know it's love when all you want is that person to be happy, even if you're not part of their happiness.",author:"~Julia Roberts"),
    Trust_Class(quote:"Love has nothing to do with what you are expect to get — only with what you are expecting to give — which is everything.",author:"~Katharine Hepburn"),
    Trust_Class(quote:"Where there is great love, there are always miracles.",author:"~Willa Cather"),
    Trust_Class(quote:"In real love, you want the other person's good.In romantic love, you want the other person.",author:"~Margaret Anderson"),
    Trust_Class(quote:"Have enough courage to trust love one more time and always one more time.",author:"~Maya Angelou"),
    Trust_Class(quote:"True love is singing karaoke Under Pressure and letting the other person sing the Freddie Mercury part",author:"~Mindy Kaling"),
    Trust_Class(quote:"When you realize you want to spend the rest of your life with sombody, you want the rest of your life to start as soon as possible.",author:"~Nora Ephron"),
    Trust_Class(quote:"Where we love is home – home that our feet may leave, but not our hearts",author:"~Oliver Wendell Holmes Sr"),
    Trust_Class(quote:"Lots of people want to ride with you in the limo, but what you want is someone who will take the bus with you when the limo breaks down.",author:"~Oprah Winfrey"),
    Trust_Class(quote:"Love is that condition in which the happiness of another person is essential to your own.",author:"~Robert A. Heinlein"),
    Trust_Class(quote:"I love you not only for what you are, but for what I am when I am with you.",author:"~Roy Croft"),
    Trust_Class(quote:"I'm just a big believer in 'you must love yourself before you can love anybody else' and I think for me that breeds the most inspired relationships.",author:"~Scarlett Johansson"),
    Trust_Class(quote:"When you are missing someone, time seems to move slower, and when I'm falling in love with someone, time seems to be moving faster.",author:"~Taylor Swift"),
    Trust_Class(quote:"ou found parts of me I didn't know exists and in you I fould a love I no longer believed was real.",author:"~Unknown"),
    Trust_Class(quote:"Love makes your soul crawl out from its hiding place.",author:"~Zora Neale Hurston"),
    Trust_Class(quote:"There is only one happiness in this life, to love and be loved.",author:"~George Sand"),
    Trust_Class(quote:"I swear I couldn't love you more than I do right now, and yet I know I will tomorrow.",author:"~Leo Christopher"),
    Trust_Class(quote:"Love does not dominate; it cultivates",author:"~Johann Wolfgang von Goethe"),
    Trust_Class(quote:"The only thing we never get enough of is love; and the only thing we never give enough of is love.",author:"~Henry Miller"),
    Trust_Class(quote:"It is a curious thought, but it is only when you see people looking ridiculous that you realize just how much you love them.",author:"~Agatha Christie"),
    Trust_Class(quote:"Love is the whole thing. We are only pieces.",author:"~Rumi"),
    Trust_Class(quote:"True love comes quietly, without banners or flashing lights. If you hear bells, get your ears checked.",author:"~Erich Segal"),
    Trust_Class(quote:"To love and be loved is to feel the sun from both sides.",author:"~David Viscott"),
    Trust_Class(quote:"Life is the flower for which love is the honey.",author:"~Victor Hugo"),
    Trust_Class(quote:"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.",author:"~Lao Tzu"),
    Trust_Class(quote:"You always gain by giving love.",author:"~Reese Witherspoon"),
    Trust_Class(quote:"All that you are is all that I’ll ever need.",author:"~Ed Sheeran"),
    Trust_Class(quote:"I love her, and that’s the beginning and end of everything.",author:"~F. Scott Fitzgerald"),
    Trust_Class(quote:"Love recognizes no barriers.",author:"~Maya Angelou"),
    Trust_Class(quote:"Love is composed of a single soul inhabiting two bodies",author:"~Aristotle"),
    Trust_Class(quote:"We are most alive when we're in love.",author:"~John Updike"),
    Trust_Class(quote:"There is no charm equal to tenderness of heart",author:"~Jane Austen"),
    Trust_Class(quote:"The heart has its reasons of which reason knows nothing.",author:"~Blaise Pascal"),
    Trust_Class(quote:"Love is friendship that has caught fire.",author:"~Ann Landers"),
    Trust_Class(quote:"Love yourself first and everything falls into line.",author:"~Lucille Ball"),
    Trust_Class(quote:"You can't blame gravity for falling in love.",author:"~Albert Einstein"),
    Trust_Class(quote:"If you find someone you love in your life, then hang on to that love.",author:"~Princess Diana"),
    Trust_Class(quote:"I think I'd miss you even if we never met.",author:"~The Wedding Date"),
    Trust_Class(quote:"I fell in love the way you fall asleep: slowly, and then all at once.",author:"~John Green"),
    Trust_Class(quote:"A simple 'I love you' means more than money.",author:"~Frank Sinatra"),
    Trust_Class(quote:"Everything I do, I do it for you.",author:"~Bryan Adams"),
    Trust_Class(quote:"You don't marry someone you can live with — you marry someone you cannot live without.",author:"~Unknown"),
    Trust_Class(quote:"I want all of you, forever, you and me, every day.",author:"~Nicholas Sparks"),
    Trust_Class(quote:"To me, you are perfect.",author:"~Love Actually"),
    Trust_Class(quote:"If you live to be a hundred, I want to live to be a hundred minus one day, so I never have to live without you.",author:"~Winnie the Pooh"),
    Trust_Class(quote:"True love stories never have endings.",author:"~Richard Bach"),
    Trust_Class(quote:"There's nothing that I wouldn't do to make you feel my love.",author:"~Bob Dylan"),
    Trust_Class(quote:"Tis better to have loved and lost, than never to have loved at all.",author:"~Alfred"),
    Trust_Class(quote:"Love is something sent from heaven to worry the hell out of you.",author:"~Dolly Parton"),
    Trust_Class(quote:"To be brave is to love someone unconditionally, without expecting anything in return.",author:"~Madonna"),
    Trust_Class(quote:"You know you're in love when you can't fall asleep because the reality is finally better than your dreams.",author:"~Dr. Seuss"),
    Trust_Class(quote:"I love being married. It's so great to find one special person you want to annoy for the rest of your life.",author:"~Rita Rudner"),
    Trust_Class(quote:"The best thing to hold onto in life is each other.",author:"~Audrey Hepburn"),
    Trust_Class(quote:"You should be kissed and often, and by someone who knows how.",author:"~Gone With the Wind"),
    Trust_Class(quote:"Love loves to love love",author:"~James Joyce"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Quotes',
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
