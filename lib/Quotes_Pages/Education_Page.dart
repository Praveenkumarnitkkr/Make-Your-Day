import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);
  @override
  _EducationState createState() => _EducationState();
}
class _EducationState extends State<Education> {
  List<Trust_Class> Show_It=[
    Trust_Class(quote:" An investment in knowledge pays the best interest. ",author:"~Benjamin Franklin"),
    Trust_Class(quote:"Change is the end result of all true learning.",author:"~Leo Buscaglia"),
    Trust_Class(quote:"Education is the passport to the future, for tomorrow belongs to those who prepare for it today. ",author:"~Malcolm X"),
    Trust_Class(quote:"The roots of education are bitter, but the fruit is sweet.",author:"~Aristotle"),
    Trust_Class(quote:". Education is what remains after one has forgotten what one has learned in school",author:"~Albert Einstein"),
    Trust_Class(quote:"The more that you read, the more things you will know, the more that you learn, the more places you’ll go",author:"~ Dr. Seuss"),
    Trust_Class(quote:"Live as if you were to die tomorrow. Learn as if you were to live forever",author:"~Mahatma Gandhi"),
    Trust_Class(quote:"Education without values, as useful as it is, seems rather to make man a more clever devil.",author:"~ C.S. Lewis"),
    Trust_Class(quote:"The learning process continues until the day you die",author:" ~Kirk Douglas "),
    Trust_Class(quote:"Education is not the filling of a pail, but the lighting of a fire",author:"~W.B Yeats"),
    Trust_Class(quote:"Develop a passion for learning. If you do, you will never cease to grow. ",author:"~Anthony J. D’Angelo"),
    Trust_Class(quote:"Education is not preparation for life; education is life itself. ",author:"~John Dewey"),
    Trust_Class(quote:"Knowledge is power. Information is liberating. Education is the premise of progress, in every society, in every family. ",author:" ~Kofi Annan"),
    Trust_Class(quote:"A person who won’t read has no advantage over one who can’t read",author:"~Mark Twain"),
    Trust_Class(quote:" Education is a better safeguard of liberty than a standing army. ",author:" ~Edward Everett "),
    Trust_Class(quote:" They know enough who know how to learn.",author:"~Henry Adams",),
    Trust_Class(quote:"Upon the subject of education … I can only say that I view it as the most important subject which we as a people may be engaged in.",author:" ~Abraham Lincoln"),
    Trust_Class(quote:". Learning is like rowing upstream: not to advance is to drop back.",author:"~Chinese proverb"),
    Trust_Class(quote:" Nine-tenths of education is encouragement. –",author:"~Anatole France"),
    Trust_Class(quote:" Man can learn nothing except by going from the known to the unknown.",author:"~Claude Bernard"),
    Trust_Class(quote:"Education is the ability to listen to almost anything without losing your temper or your self-confidence.",author:"~Robert Frost"),
    Trust_Class(quote:"Learning is not attained by chance, it must be sought for with ardor and attended to with diligence.",author:"~Abigail Adams"),
    Trust_Class(quote:"Educating the mind without educating the heart is no education at all",author:"~Aristotle"),
    Trust_Class(quote:" It is as impossible to withhold education from the receptive mind as it is impossible to force it upon the unreasoning.-",author:"~Agnes Repplierg"),
    Trust_Class(quote:" They cannot stop me. I will get my education, if it is in the home, school, or anyplace. ",author:"~Malala Yousafzai"),
    Trust_Class(quote:"I was reading the dictionary. I thought it was a poem about everything. ",author:"~Steven Wright"),
    Trust_Class(quote:"The man who reads nothing at all is better educated than the man who reads nothing but newspapers.”",author:"~Thomas Jefferson"),
    Trust_Class(quote:"Learning is not compulsory. Neither is survival.",author:"~ Dr. W. Edwards Deming"),
    Trust_Class(quote:". Learning is not the product of teaching. Learning is the product of the activity of learners.",author:"~John Holt"),
    Trust_Class(quote:"Take the attitude of a student, never be too big to ask questions, never know too much to learn something new.",author:"~ Og Mandino"),
    Trust_Class(quote:"Education is the most powerful weapon which you can use to change the world. ",author:"~Nelson Mandela"),
    Trust_Class(quote:"To me education is a leading out of what is already there in the pupil’s soul.",author:" ~Muriel Spark"),
    Trust_Class(quote:"“He who opens a school door, closes a prison",author:" ~Victor Hugo"),
    Trust_Class(quote:" Education is the ability to meet life’s situations",author:"~Dr. John G. Hibben"),
    Trust_Class(quote:"Learning starts with failure; the first failure is the beginning of education",author:"~John Hersey"),
    Trust_Class(quote:"I have never let my schooling interfere with my education.",author:"~Mark Twain"),
    Trust_Class(quote:"Intelligence plus character-that is the goal of true education.",author:"~Martin Luther King Jr."),
    Trust_Class(quote:"Education is for improving the lives of others and for leaving your community and world better than you found it",author:"~Marian Wright Edelman"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Quotes',
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
