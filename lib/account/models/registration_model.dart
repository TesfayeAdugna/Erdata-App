class Registration {
  int? id;
  String? password;
  String? password2;
  String? username;
  String? first_name;
  String? last_name;
  String? email;
  Registration(
      {this.id,
      this.username,
      this.password,
      this.password2,
      this.first_name,
      this.last_name,
      this.email});
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
