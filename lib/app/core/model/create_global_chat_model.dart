class CreateGlobalChatModel {
  String userId;
  String message;
  String image;

  CreateGlobalChatModel({
    required this.userId,
    required this.message,
    required this.image,
  });

  factory CreateGlobalChatModel.fromJson(Map<String, dynamic> json) =>
      CreateGlobalChatModel(
        userId: json["user_id"],
        message: json["message"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "message": message,
        "image": image,
      };
}
