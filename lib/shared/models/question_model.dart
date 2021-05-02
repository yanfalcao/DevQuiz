import 'package:flutter/cupertino.dart';
import 'awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({
    @required this.title,
    @required this.awnsers
  }) : assert(awnsers.length == 4);

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "awnsers": this.awnsers.map((e) => e.toJson()).toList(),
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      title: json["title"],
      awnsers: List.of(json["awnsers"]).map((i) => AwnserModel.fromJson(i)).toList(),
    );
  }
}