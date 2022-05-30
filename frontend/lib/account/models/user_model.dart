class UserBE {
  String? email;
  String? username;
  String? date_joined;

  UserBE({this.username, this.email,this.date_joined});
  factory UserBE.fromJson(Map<String, dynamic> json) {
    return UserBE(username: json["username"], email: json["email"],
    date_joined: json["date_joined"]);
  }
}
