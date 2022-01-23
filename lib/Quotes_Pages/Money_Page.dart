import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Trust_Class.dart';

class Money extends StatefulWidget {
  const Money({Key? key}) : super(key: key);

  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {

  List<Trust_Class> Show_It=[

    Trust_Class(quote:"Too many people spend money they earned..to buy things they don't want..to impress people that they don't like",author:"~Will Rogers"),
    Trust_Class(quote:"A wise person should have money in their head, but not in their heart",author:"~Jonathan Swift"),
    Trust_Class(quote:"Wealth consists not in having great possessions, but in having few wants.",author:"~Epictetus"),
    Trust_Class(quote:"Money often costs too much",author:"~Ralph Waldo Emerson"),
    Trust_Class(quote:"Everyday is a bank account, and time is our currency. No one is rich, no one is poor, we've got 24 hours each.",author:"~Christopher Rice"),
    Trust_Class(quote:"It's how you deal with failure that determines how you achieve success. ",author:"~David Feherty"),
    Trust_Class(quote:"Frugality includes all the other virtues. ",author:"~Cicero"),
    Trust_Class(quote:"I love money. I love everything about it. I bought some pretty good stuff. Got me a 300 pair of socks. Got a fur sink. An electric dog polisher. A gasoline powered turtleneck sweater. And, of course, I bought some dumb stuff, too",author:"~Steve Martin"),
    Trust_Class(quote:"An investment in knowledge pays the best interest",author:"~Benjamin Franklin"),
    Trust_Class(quote:"I will tell you the secret to getting rich on Wall Street. You try to be greedy when others are fearful. And you try to be fearful when others are greedy.",author:"~Warren Buffett"),
    Trust_Class(quote:"Annual income twenty pounds, annual expenditure nineteen six, result happiness. Annual income twenty pounds, annual expenditure twenty pound ought and six, result misery.",author:"~Charles Dickens"),
    Trust_Class(quote:"Opportunity is missed by most people because it is dressed in overalls and looks like work.",author:"~Thomas Edison"),
    Trust_Class(quote:"I never attempt to make money on the stock market. I buy on the assumption that they could close the market the next day and not reopen it for ten years.",author:"~Warren Buffett"),
    Trust_Class(quote:"A nickel ain't worth a dime anymore",author:"~Yogi Berra"),
    Trust_Class(quote:"Money never made a man happy yet, nor will it. The more a man has, the more he wants. Instead of filling a vacuum, it makes one.",author:"~Benjamin Franklin"),
    Trust_Class(quote:"Many people take no care of their money till they come nearly to the end of it, and others do just the same with their time.",author:"~Johann Wolfgang von Goethe"),
    Trust_Class(quote:"Formal education will make you a living; self-education will make you a fortune.",author:"~Jim Rohn"),
    Trust_Class(quote:"Money is only a tool. It will take you wherever you wish, but it will not replace you as the driver. ",author:"~Ayn Rand"),
    Trust_Class(quote:"Financial peace isn't the acquisition of stuff. It's learning to live on less than you make, so you can give money back and have money to invest. You can't win until you do this. ",author:"~Dave Ramsey"),
    Trust_Class(quote:"It is not the man who has too little, but the man who craves more, that is poor",author:"~Seneca"),
    Trust_Class(quote:"It’s not the employer who pays the wages. Employers only handle the money. It’s the customer who pays the wages",author:"~Henry Ford"),
    Trust_Class(quote:"He who loses money, loses much; He who loses a friend, loses much more; He who loses faith, loses all.",author:"~Eleanor Roosevelt"),
    Trust_Class(quote:"Happiness is not in the mere possession of money; it lies in the joy of achievement, in the thrill of creative effort.",author:"~Franklin D. Roosevelt"),
    Trust_Class(quote:"Empty pockets never held anyone back. Only empty heads and empty hearts can do that.",author:"~Norman Vincent Peale"),
    Trust_Class(quote:"It’s good to have money and the things that money can buy, but it’s good, too, to check up once in a while and make sure that you haven’t lost the things that money can’t buy.",author:"~George Lorimer"),
    Trust_Class(quote:"You can only become truly accomplished at something you love. Don’t make money your goal. Instead, pursue the things you love doing, and then do them so well that people can’t take their eyes off you.",author:"~Maya Angelou"),
    Trust_Class(quote:"Buy when everyone else is selling and hold until everyone else is buying. That’s not just a catchy slogan. It’s the very essence of successful investing.",author:"~J. Paul Getty"),
    Trust_Class(quote:"If money is your hope for independence you will never have it. The only real security that a man will have in this world is a reserve of knowledge, experience, and ability.",author:"~Henry Ford"),
    Trust_Class(quote:"If all the economists were laid end to end, they’d never reach a conclusion.",author:"~George Bernard Shaw"),
    Trust_Class(quote:"How many millionaires do you know who have become wealthy by investing in savings accounts? I rest my case",author:"~Robert G. Allen"),
    Trust_Class(quote:"I made my money the old-fashioned way. I was very nice to a wealthy relative right before he died.",author:"~Malcolm Forbes"),
    Trust_Class(quote:"Innovation distinguishes between a leader and a follower.",author:"~Steve Jobs"),
    Trust_Class(quote:"The real measure of your wealth is how much you'd be worth if you lost all your money. ",author:"~Anonymous"),
    Trust_Class(quote:"Money is a terrible master but an excellent servant",author:"~P.T. Barnum"),
    Trust_Class(quote:"Try to save something while your salary is small; it’s impossible to save after you begin to earn more. ",author:"~Jack Benny"),
    Trust_Class(quote:"Wealth is the ability to fully experience life",author:"~Henry David Thoreau"),
    Trust_Class(quote:"The individual investor should act consistently as an investor and not as a speculator",author:"~Ben Graham"),
    Trust_Class(quote:"I’m a great believer in luck, and I find the harder I work the more I have of it.",author:"~Thomas Jefferson"),
    Trust_Class(quote:"You must gain control over your money or the lack of it will forever control you.",author:"~Dave Ramsey"),
    Trust_Class(quote:"Investing should be more like watching paint dry or watching grass grow. If you want excitement, take 800 and go to Las Vegas.",author:"~Paul Samuelson"),
    Trust_Class(quote:"Every time you borrow money, you're robbing your future self.",author:"~Nathan W. Morris"),
    Trust_Class(quote:"Rich people have small TVs and big libraries, and poor people have small libraries and big TVs",author:"~Zig Ziglar"),
    Trust_Class(quote:"Never spend your money before you have it. ",author:"~Thomas Jefferson"),
    Trust_Class(quote:"The stock market is filled with individuals who know the price of everything, but the value of nothing.",author:"~Phillip Fisher"),
    Trust_Class(quote:"Wealth is not his that has it, but his that enjoys it. ",author:"~Benjamin Franklin"),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Money Quotes',
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
