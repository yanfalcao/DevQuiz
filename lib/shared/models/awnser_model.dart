import 'package:flutter/cupertino.dart';

class AwnserModel {
  final String title;
  final bool isRight;

  AwnserModel({
    @required this.title,
    this.isRight = false
  });

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "isRight": this.isRight ?? false,
    };
  }

  factory AwnserModel.fromJson(Map<String, dynamic> json) {
    return AwnserModel(
      title: json["title"],
      isRight: json["isRight"] ?? false,
    );
  }
}