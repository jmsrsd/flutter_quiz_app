import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../common/models/quiz_collection.dart';
import '../db.dart';

class QuizRepository {
  late LazyBox<String> _box;

  Future<void> init() async {
    _box = await Hive.openLazyBox('quiz');
  }

  Future<void> put(QuizCollection value) async {
    await init();

    await _box.put('*', jsonEncode(value.toJson()));
  }

  Future<QuizCollection> get() async {
    await init();

    try {
      await put(await fetch());
    } catch (error, stackTrace) {
      debugPrint('$error');
      debugPrintStack(stackTrace: stackTrace);
    }

    final encoded = await _box.get('*');

    final decoded = jsonDecode(encoded ?? '{}');

    final value = Map.of(decoded).cast<String, dynamic>();

    return QuizCollection.fromJson(value);
  }

  Future<QuizCollection> fetch() async {
    final data = await db.child('quiz').get();

    final encoded = jsonEncode(data.value ?? {});

    debugPrint('QuizCollection: $encoded');

    final decoded = jsonDecode(encoded);

    final json = Map.of(decoded).cast<String, dynamic>();

    final result = QuizCollection.fromJson(json);

    debugPrint('${result.runtimeType}: $result');

    return result;
  }
}
