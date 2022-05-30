class Children {
  int? id;
  String? first_name;
  String? last_name;
  String? gender;
  String? photos;
  String? birth_date;
  String? description;
  String? bank_account;
  String? kebele;
  String? woreda;
  String? zone;
  String? region;
  Children(
      {this.id,
      this.first_name,
      this.last_name,
      this.photos,
      this.gender,
      this.birth_date,
      this.description,
      this.bank_account,
      this.kebele,
      this.region,
      this.woreda,
      this.zone});
  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
        id: json["id"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        photos: json["photos"],
        gender: json["gender"],
        birth_date: json["brith_date"],
        description: json["description"],
        bank_account: json["bank_account"],
        kebele: json["kebele"],
        region: json["region"],
        zone: json["zone"],
        woreda: json["woreda"]);
  }
}
