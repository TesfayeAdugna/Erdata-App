class Suggestion {
  int? id;
  String suggested_by;
  String date;
  String child_name;
  String gender;
  String brith_date;
  String description;
  Suggestion(
      {this.id,
      required this.suggested_by,
      required this.date,
      required this.child_name,
      required this.gender,
      required this.brith_date,
      required this.description});
  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
        id: json["id"],
        suggested_by: json["suggested_by"],
        date: json["date"],
        child_name: json["child_name"],
        gender: json["gender"],
        brith_date: json["brith_date"],
        description: json["description"]);
  }
}
