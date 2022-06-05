import 'package:sec_2/erdata/screens/screens.dart';

class Children {
  int? id;
  String first_name;
  String last_name;
  String gender;
  int age;
  String description;
  String kebele;
  String woreda;
  String zone;
  String region;
  Children(
      {this.id,
      required this.first_name,
      required this.last_name,
      required this.gender,
      required this.age,
      required this.description,
      required this.kebele,
      required this.region,
      required this.woreda,
      required this.zone});
  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
        id: json["id"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        gender: json["gender"],
        age: json["age"],
        description: json["description"],
        kebele: json["kebele"],
        region: json["region"],
        zone: json["zone"],
        woreda: json["woreda"]);
  }

  // Map<String, dynamic> toJson() {
  //   return ;
  // }
}
