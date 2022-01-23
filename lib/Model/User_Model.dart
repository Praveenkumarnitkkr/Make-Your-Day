
class usermodel{
  String? uid;
  String? email;
  String? name;
  String? secondname;
  String? pass;
  usermodel({this.uid,this.name,this.email,this.secondname,this.pass});

  //data from server
  factory usermodel.fromMap(map){
    return usermodel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      secondname: map['secondname'],
      pass: map['pass'],
    );
  }
  // sending to our server
  Map<String,dynamic>toMap(){
    return{
      'uid': uid,
      'name': name,
      'Secondname': secondname,
      'email':email,
      'pass': pass,
    };
  }
}