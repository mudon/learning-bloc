import 'dart:convert';

class PostDataUiModel {
  int userId;
  int id;
  String title;
  String body;

  PostDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDataUiModel.fromMap(Map<String, dynamic> json) {
    return PostDataUiModel(
      userId: json["userId"]?.toInt() ?? 0,
      id: json["id"]?.toInt() ?? 0,
      title: json["title"] ?? '',
      body: json["body"] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    };
  }

  // Factory constructor for creating a new PostDataUiModel instance from JSON
  factory PostDataUiModel.fromJson(Map<String, dynamic> json) =>
      PostDataUiModel.fromMap(json);

  // Convert a PostDataUiModel instance to a JSON Map
  Map<String, dynamic> toJson() => toMap();
}
