class CreateGlobalUserModel {
  String name;
  String email;
  String phoneNumber;
  String gender;
  String address;
  String city;
  String state;
  String dateOfBirth;

  CreateGlobalUserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.city,
    required this.state,
    required this.dateOfBirth,
  });

  factory CreateGlobalUserModel.fromJson(Map<String, dynamic> json) =>
      CreateGlobalUserModel(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        dateOfBirth: json["date_of_birth"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "address": address,
        "city": city,
        "state": state,
        "date_of_birth": dateOfBirth,
      };
}
