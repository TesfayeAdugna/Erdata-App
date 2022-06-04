import 'package:sec_2/erdata/screens/screens.dart';

class Children {
  int? id;
  String first_name;
  String last_name;
  String gender;
  String photos;
  String birth_date;
  String description;
  String bank_account;
  String kebele;
  String woreda;
  String zone;
  String region;
  Children(
      {this.id,
      required this.first_name,
      required this.last_name,
      required this.photos,
      required this.gender,
      required this.birth_date,
      required this.description,
      required this.bank_account,
      required this.kebele,
      required this.region,
      required this.woreda,
      required this.zone});
  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
        id: json["id"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        photos: json["photos"],
        gender: json["gender"],
        birth_date: json["birth_date"],
        description: json["description"],
        bank_account: json["bank_account"],
        kebele: json["kebele"],
        region: json["region"],
        zone: json["zone"],
        woreda: json["woreda"]);
  }

  // Map<String, dynamic> toJson() {
  //   return ;
  // }
}
