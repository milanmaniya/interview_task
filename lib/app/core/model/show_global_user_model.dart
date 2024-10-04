class ShowGlobalUserModel {
  String status;
  String message;
  List<Datum> data;

  ShowGlobalUserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowGlobalUserModel.fromJson(Map<String, dynamic> json) => ShowGlobalUserModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String email;
  String phoneNumber;
  String gender;
  String address;
  String city;
  String state;
  String dateOfBirth;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.city,
    required this.state,
    required this.dateOfBirth,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        dateOfBirth: json["date_of_birth"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "address": address,
        "city": city,
        "state": state,
        "date_of_birth": dateOfBirth,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
