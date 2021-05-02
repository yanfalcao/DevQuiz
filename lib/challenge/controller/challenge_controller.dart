import 'dart:core';
import 'package:flutter/foundation.dart';

class ChallengeController{
  final currentPageNotifier = ValueNotifier<int>(0);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int hits = 0;
}