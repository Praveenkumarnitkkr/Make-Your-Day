import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_your_day/Model/Push_Notification.dart';
import 'package:make_your_day/Notes/Show_Notes.dart';
import 'package:make_your_day/Pages/Publish.dart';
import 'package:overlay_support/overlay_support.dart';
import 'Drawer_Page.dart';
import 'Quotes_Categories.dart';
class First_Page extends StatefulWidget {
  const First_Page({Key? key}) : super(key: key);
  @override
  _First_PageState createState() => _First_PageState();
}
class _First_PageState extends State<First_Page> {
  double width=350;
  double height=150;
  double newwidth= 160;
  double newheight=310;
  String? notificationtitle;
  String? notificationdata;
  late final FirebaseMessaging _messaging;
  // model for pushnotification
  late pushnotification _notificationifo;
  //register notification
  void registernotification()async{
    // intialise the firebase application
    await Firebase.initializeApp();
    // create an instance for firebase messaging
    _messaging= FirebaseMessaging.instance;
    // three type of state in notification
    // not determined=null
    // granted
    //declined
    // all notification settings
    NotificationSettings setting=await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false
    );
    // weather the user has granted permissions or not
    if(setting.authorizationStatus==AuthorizationStatus.authorized){
      // Main message
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        pushnotification notification=pushnotification(
          title: message.notification!.title,
          body: message.notification!.body,
          bodydata: message.data['body'],
          titledata: message.data['title'],
        );
        setState(() {
          // -_totalnotificationcounter++;
          _notificationifo=notification;
        });
        if(notification!=null){
          notificationdata=_notificationifo.title;
          notificationtitle=_notificationifo.titledata;
          showSimpleNotification(
            Text(_notificationifo.title!),
            subtitle: Text(_notificationifo.body!),
            background: Colors.lightBlueAccent,
            duration: Duration(seconds:5),
          );
        }
      });
    }
  }
  @override
  void initState(){
    super.initState();
    registernotification();
    Fluttertoast.showToast(msg: "Welcome To Make Your Day,It's Praveen Kumar Creation");
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        width = 450;
        height = 200;
        newwidth=MediaQuery.of(context).size.width*0.46;
        newheight=MediaQuery.of(context).size.height*0.43;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer_Page(),
      appBar: AppBar(
        title: Text(
          "Make Your Day",
          style: GoogleFonts.balooBhai(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        elevation: 10,
        shadowColor: Colors.blueAccent,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.blueGrey,
                    Colors.lightBlueAccent,
                    Colors.blueGrey,
                    // Colors.,
                  ]
              )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: AnimatedContainer(
                curve: Curves.bounceOut,
                duration: Duration(seconds:2),
                decoration: BoxDecoration(
                    image:DecorationImage(
                      fit: BoxFit.cover,
                      // colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                      image: AssetImage("lib/images/Reader1.jpg"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  color: Colors.black45,
                ),
                width: width,
                height: height,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Quote_Categories())
                    );
                  },
                  child: Text(
                    'Reader',
                    style: GoogleFonts.balooBhai(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: Duration(seconds: 2),
                  width: newwidth,
                  height: newheight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
                          image: AssetImage('lib/images/Publish.jpg')
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Publish()));
                    },
                    child: Text('Publish',
                      style:GoogleFonts.balooBhai(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: Duration(seconds: 2),
                  width:newwidth,
                  height: newheight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.black87,BlendMode.darken),
                          image: AssetImage('lib/images/Writeabout1.jpg')
                      ),
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black45,
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Show_notes())
                      );
                    },
                    child: Text('Write Your Day',
                      style: GoogleFonts.balooBhai(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
