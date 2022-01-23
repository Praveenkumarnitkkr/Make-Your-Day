import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Quotes_Pages/Attitude_Page.dart';
import 'package:make_your_day/Quotes_Pages/Alone_Page.dart';
import 'package:make_your_day/Quotes_Pages/Badass_Page.dart';
import 'package:make_your_day/Quotes_Pages/Courage_Page.dart';
import 'package:make_your_day/Quotes_Pages/Education_Page.dart';
import 'package:make_your_day/Quotes_Pages/Dream_Page.dart';
import 'package:make_your_day/Quotes_Pages/Favourite.dart';
import 'package:make_your_day/Quotes_Pages/Fitness_Page.dart';
import 'package:make_your_day/Quotes_Pages/Freedom_Page.dart';
import 'package:make_your_day/Quotes_Pages/Happiness_Page.dart';
import 'package:make_your_day/Quotes_Pages/Insipirational_Page.dart';
import 'package:make_your_day/Quotes_Pages/Leadership_Page.dart';
import 'package:make_your_day/Quotes_Pages/Life_Page.dart';
import 'package:make_your_day/Quotes_Pages/Love_Page.dart';
import 'package:make_your_day/Quotes_Pages/Money_Page.dart';
import 'package:make_your_day/Quotes_Pages/Positive_Page.dart';
import 'package:make_your_day/Quotes_Pages/Success_Page.dart';
import 'package:make_your_day/Quotes_Pages/Time_Page.dart';
import 'package:make_your_day/Quotes_Pages/Trust_Pages.dart';

class Quote_Categories extends StatefulWidget {
  const Quote_Categories({Key? key}) : super(key: key);
  @override
  _Quote_CategoriesState createState() => _Quote_CategoriesState();
}
class _Quote_CategoriesState extends State<Quote_Categories> {

  double widthnew=150;
  double heightnew=100;
  double favwidth=500;
  double favheight=100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        setState(() {
          widthnew=MediaQuery.of(context).size.width*0.43;
          heightnew=150;
          favwidth=MediaQuery.of(context).size.width*0.90;
          favheight=200;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quotes',
          style:GoogleFonts.balooBhai(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.blueGrey,
                    Colors.lightBlueAccent,
                    Colors.blueGrey,
                  ]

              )
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: Duration(seconds:1),
                curve: Curves.bounceOut,
                padding: EdgeInsets.all(40),
                width: favwidth,
                height: favheight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/Favourite.jpg"),
                    colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black45,
                ),
                child:ButtonTheme(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
                    },
                    child: Text(
                      'Favourites',
                      style: GoogleFonts.balooBhai(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/Freedom.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Positive())
                      );
                    },
                    child: Text(
                      'Positive',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/Trust.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Trust())
                      );
                    },
                    child: Text(
                      'Trust',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.bounceOut,
                  width:widthnew,
                  height: heightnew,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                        image: AssetImage(
                          'lib/images/Alone.jpg',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Alone())
                      );
                    },
                    child: Text(
                      'Alone',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                           colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                        image: AssetImage('lib/images/Attitude.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(10),
                   color: Colors.black45,
                  ),
                  child: ButtonTheme(
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Attitude())
                        );
                      },
                      child: Text(
                        'Attitude',
                        style: GoogleFonts.balooBhai(
                          fontSize: 25,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                        image: AssetImage('lib/images/love3.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Love()));
                    },
                    child: Text(
                      'Love',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage('lib/images/Education.jpg'),
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>Education()
                          ));
                    },
                    child: Text(
                      'Education',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage('lib/images/Time.jpg'),
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Time()));
                    },
                    child: Text(
                      'Time',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/Dream.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Dream())
                      );
                    },
                    child: Text(
                      'Dreams',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/Leader.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Leadership())
                      );
                    },
                    child: Text(
                      'Leader',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/images/Success.jpg'),
                          fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Success())
                      );
                    },
                    child: Text(
                      'Success',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/Freedom2.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Freedom())
                      );
                    },
                    child: Text(
                      'Freedom',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ) ,

                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/money.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Money())
                      );
                    },
                    child: Text(
                      'Money',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/images/Fitness.jpg'),
                          fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Fitness())
                      );
                    },
                    child: Text(
                      'Fitness',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/Courage.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Courage())
                      );
                    },
                    child: Text(
                      'Courage',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/Happiness.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Happiness())
                      );
                    },
                    child: Text(
                      'Happy',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/images/Insipirational.jpg'),
                          fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Insipirational())
                      );
                    },
                    child: Text(
                      'Insipritional',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/Life.jpg'),
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Life())
                      );
                    },
                    child: Text(
                      'Life',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  width:widthnew,
                  height:heightnew,
                  duration: Duration(seconds:1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/Badass.jpg'),
                        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),

                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Badass())
                      );
                    },
                    child: Text(
                      'Badass',
                      style: GoogleFonts.balooBhai(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:10,),
          ],
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
