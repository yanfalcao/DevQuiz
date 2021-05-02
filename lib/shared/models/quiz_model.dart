import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';

enum Level{
  facil, medio, dificil, perito
}

extension LevelStringExt on String {
  Level get levelParse => {
    'facil' : Level.facil,
    'medio' : Level.medio,
    'dificil' : Level.dificil,
    'perito' : Level.perito
  }[this];
}

extension LevelExt on Level {
  String get parse => {
    Level.facil : 'facil',
    Level.medio : 'medio',
    Level.dificil : 'dificil',
    Level.perito : 'perito'
  }[this];
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final String image;
  final Level level;

  QuizModel({
    @required this.title,
    @required this.questions,
    this.questionAwnsered = 0,
    @required this.image,
    @required this.level
  }) : assert(questions.length > 0);

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "questions": this.questions.map((e) => e.toJson()).toList(),
      "questionAwnsered": this.questionAwnsered,
      "image": this.image,
      "level": level.parse,
    };
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      title: json["title"],
      questions: List.of(json["questions"])
          .map((i) => QuestionModel.fromJson(i))
          .toList(),
      questionAwnsered: json["questionAwnsered"],
      image: json["image"],
      level: json["level"].toString().levelParse,
    );
  }
}