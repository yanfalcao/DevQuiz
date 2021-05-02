import 'dart:convert';

import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:flutter/services.dart';

class HomeRepository{
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString('lib/database/user.json');
    final user = UserModel.fromJson(jsonDecode(response));
    
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString('lib/database/quizzes.json');
    return (jsonDecode(response) as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }
}