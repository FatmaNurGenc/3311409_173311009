class UserModel {
  String? uid;
  String? email;
  String? kullaniciadi;

  UserModel({this.uid,this.email,this.kullaniciadi});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      kullaniciadi: map['kullaniciadi'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'kullaniciadi': kullaniciadi,
    };
  }

}