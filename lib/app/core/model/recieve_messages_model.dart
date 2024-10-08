// class RecieveMessagesModel {
//   String status;
//   String message;
//   List<Datum> data;

//   RecieveMessagesModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   factory RecieveMessagesModel.fromJson(Map<String, dynamic> json) =>
//       RecieveMessagesModel(
//         status: json["status"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   ChatDetails chatDetails;
//   List<UserDetail> userDetails;

//   Datum({
//     required this.chatDetails,
//     required this.userDetails,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         chatDetails: ChatDetails.fromJson(json["Chat_details"]),
//         userDetails: List<UserDetail>.from(
//             json["user_details"].map((x) => UserDetail.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Chat_details": chatDetails.toJson(),
//         "user_details": List<dynamic>.from(userDetails.map((x) => x.toJson())),
//       };
// }

// class ChatDetails {
//   int id;
//   String userId;
//   dynamic image;
//   String message;
//   DateTime createdAt;
//   DateTime updatedAt;

//   ChatDetails({
//     required this.id,
//     required this.userId,
//     required this.image,
//     required this.message,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ChatDetails.fromJson(Map<String, dynamic> json) => ChatDetails(
//         id: json["id"],
//         userId: json["user_id"],
//         image: json["image"],
//         message: json["message"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "image": image,
//         "message": message,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class UserDetail {
//   int id;
//   String name;
//   String email;
//   String phoneNumber;
//   String gender;
//   String address;
//   String city;
//   String state;
//   String dateOfBirth;
//   DateTime createdAt;
//   DateTime updatedAt;

//   UserDetail({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.gender,
//     required this.address,
//     required this.city,
//     required this.state,
//     required this.dateOfBirth,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         phoneNumber: json["phone_number"],
//         gender: json["gender"],
//         address: json["address"],
//         city: json["city"],
//         state: json["state"],
//         dateOfBirth: json["date_of_birth"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "phone_number": phoneNumber,
//         "gender": gender,
//         "address": address,
//         "city": city,
//         "state": state,
//         "date_of_birth": dateOfBirth,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

class ReceiveMessageModel {
  final bool status;
  final String message;
  final List<ChatDetail> data;

  ReceiveMessageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReceiveMessageModel.fromJson(Map<String, dynamic> json) {
    return ReceiveMessageModel(
      status: json['status'] == 'true',
      message: json['message'],
      data: List<ChatDetail>.from(
        json['data'].map((x) => ChatDetail.fromJson(x)),
      ),
    );
  }
}

class ChatDetail {
  final int id;
  final String userId;
  final String? image;
  final String? message;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<UserDetail> userDetails;

  ChatDetail({
    required this.id,
    required this.userId,
    this.image,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.userDetails,
  });

  factory ChatDetail.fromJson(Map<String, dynamic> json) {
    return ChatDetail(
      id: json['Chat_details']['id'],
      userId: json['Chat_details']['user_id'],
      image: json['Chat_details']['image'],
      message: json['Chat_details']['message'] ?? 'Hey',
      createdAt: DateTime.parse(json['Chat_details']['created_at']),
      updatedAt: DateTime.parse(json['Chat_details']['updated_at']),
      userDetails: List<UserDetail>.from(
        json['user_details'].map((x) => UserDetail.fromJson(x)),
      ),
    );
  }
}

class UserDetail {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final String address;
  final String city;
  final String state;
  final String dateOfBirth;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDetail({
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

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      gender: json['gender'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      dateOfBirth: json['date_of_birth'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
