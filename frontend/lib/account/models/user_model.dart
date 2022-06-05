class UserBE {
  int? id;
  String email;
  String username;
  String? date_joined;

  UserBE({required this.username, required this.email, this.date_joined, this.id});
  factory UserBE.fromJson(Map<String, dynamic> json) {
    return UserBE(
      id: json["id"],
        username: json["username"],
        email: json["email"],
        date_joined: json["date_joined"]);
  }
}
