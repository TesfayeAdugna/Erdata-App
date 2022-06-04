class Suggestion {
  int? id;
  String? regesterd_date;
  String child_name;
  String gender;
  int age;
  String description;
  Suggestion(
      {this.id,
      this.regesterd_date,
      required this.child_name,
      required this.gender,
      required this.age,
      required this.description});
  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
        id: json["id"],
        regesterd_date: json["regesterd_date"],
        child_name: json["child_name"],
        gender: json["gender"],
        age: json["age"],
        description: json["description"]);
  }
}
