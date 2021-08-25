class UserModel{
  String uId,name,phone,email,birthdate,password;


  UserModel({this.uId, this.name, this.phone, this.email, this.birthdate, this.password});

  UserModel.fromJson(Map<String,dynamic> json){
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    birthdate = json['birthdate'];
    password = json['password'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'uId':uId,
      'name':name,
      'phone':phone,
      'email':email,
      'password':password,
    };
  }


}