class UserModel{
  String username;
  String email;
  String url;
  String id;
  UserModel({required this.username, required  this.email, required  this.url, required this.id});
  factory UserModel.fromjson(Map<String,dynamic> json )
  {
    return UserModel(username: json["name"], email: json['email'], url: json['imgurl'], id: json['id']);
  }
  Map<String,dynamic> tojson(){
    return {
      'name':username,
      'imgurl':url,
      'email':email,
      'id':id,
    };
  }
}