class Registration {
  int? id;
  String password;
  String password2;
  String username;
  String first_name;
  String last_name;
  String email;
  Registration(
      {this.id,
      required this.username,
      required this.password,
      required this.password2,
      required this.first_name,
      required this.last_name,
      required this.email});
  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
        id: json["id"],
        username: json["username"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        email: json["email"],
        password: json["password"],
        password2: json["password2"]);
  }
}
