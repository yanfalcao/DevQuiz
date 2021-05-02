import 'package:flutter/cupertino.dart';

class UserModel{
  final String name;
  final String photoUrl;
  final int score;

  UserModel({
    @required this.name,
    @required this.photoUrl,
    this.score =  0
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      photoUrl: json["photoUrl"],
      score: json["score"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "photoUrl": this.photoUrl,
      "score": this.score,
    };
  }
}