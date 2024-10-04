class UpdateGlobalUser {
  String name;
  String gender;
  String address;
  String city;
  String state;
  String dateOfBirth;

  UpdateGlobalUser({
    required this.name,
    required this.gender,
    required this.address,
    required this.city,
    required this.state,
    required this.dateOfBirth,
  });

  factory UpdateGlobalUser.fromJson(Map<String, dynamic> json) =>
      UpdateGlobalUser(
        name: json["name"],
        gender: json["gender"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        dateOfBirth: json["date_of_birth"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "address": address,
        "city": city,
        "state": state,
        "date_of_birth": dateOfBirth,
      };
}
