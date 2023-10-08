import 'package:flutter/material.dart';

import '../utils/db.dart';

class QuizService {
  Future<dynamic> collectQuiz() async {
    final data = await db.child('quiz').get();

    final result = data.value;

    debugPrint('${result.runtimeType}: $result');

    return result;
  }
}
