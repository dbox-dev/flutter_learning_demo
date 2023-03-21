// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  User copyWith({
    required String username,
    required String password,
  }) =>
      User(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}
