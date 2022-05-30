class Suggestion {
  int? id;
  String? suggested_by;
  String? date;
  String? child_name;
  String? gender;
  String? brith_date;
  String? description;
  Suggestion(
      {this.id,
      this.suggested_by,
      this.date,
      this.child_name,
      this.gender,
      this.brith_date,
      this.description});
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
