import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/quiz_collection.dart';
import '../utils/db.dart';

class QuizService {
  Future<QuizCollection> collectQuiz() async {
    final data = await db.child('quiz').get();

    final Map json = (jsonDecode(jsonEncode(data.value)) ?? {}) as dynamic;

    final result = QuizCollection.fromJson(json.map((k, v) {
      return MapEntry('$k', v);
    }));

    debugPrint('${result.runtimeType}: $result');

    return result;
  }
}
