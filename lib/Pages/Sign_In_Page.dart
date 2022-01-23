import 'package:make_your_day/Pages/User_Page.dart';
import 'package:make_your_day/Pages/verify_email.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'First_Page.dart';
import 'Sign_Up_Page.dart';
class Sign_In_Page extends StatefulWidget {
  const Sign_In_Page({Key? key}) : super(key: key);
  @override
  _Sign_In_PageState createState() => _Sign_In_PageState();
}
class _Sign_In_PageState extends State<Sign_In_Page> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      throw e;
    }
  }

  Future<void> loadFirebase() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: User_email_id.text, password: user_Passowrd.text)
        .then((value) => {
          if(FirebaseAuth.instance.currentUser!.emailVerified){   
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=>First_Page())
          )}
          else Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Verify()))
   
    }).catchError((e){
      setState(() {
        showspin=false;
      });
      Fluttertoast.showToast(msg: e!.message);
    });
  }
  double height=150;
  double radius=50;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
         height=250;
         radius=80;
      });
    });
  }
  final key= GlobalKey<FormState>();
  final _auth=FirebaseAuth.instance;
  final  User_email_id=TextEditingController();
  final user_Passowrd=TextEditingController();
  bool showspin=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Make Your Day',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
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
        automaticallyImplyLeading: false,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspin,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: height,
                curve:Curves.linear,
                child:Image(
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  image: AssetImage('lib/images/app.png'),
                )
              ),
              Form(
                key: key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: User_email_id,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your email-id";
                          }
                        },
                        decoration:InputDecoration(
                          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.mail,
                          ),
                          hintText: "Email-id",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller:user_Passowrd,
                        validator: (password){
                          if(password!.isEmpty){
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration:InputDecoration(
                          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                          ),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: <Color>[
                                Colors.blueGrey,
                                Colors.lightBlueAccent,
                                Colors.blueGrey,
                              ]
                          )
                      ),
                      child: TextButton(
                        onPressed: (){
                          if(key.currentState!.validate()){
                            setState(() {
                              showspin=true;
                            });
                            loadFirebase();
                          }
                        },
                        child: Text(
                          'Sign-in',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: Text(
                  'or',
                  style: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 40,
                    height: 40,
                    image: AssetImage('lib/images/google.jpg'),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: (){
                        signInwithGoogle();
                      },
                      child: Text(
                        'Sign-in with Google',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Text(
                      "Doesn't have an account?  ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_UP()));
                      },
                      radius: 200,
                      splashColor: Colors.blueAccent,
                      child: Text('Sign-Up',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color:Colors.blue,
                          ),
                        ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
