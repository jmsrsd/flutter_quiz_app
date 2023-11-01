import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../common/models/quiz_collection.dart';

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

    final encoded = await _box.get('*');

    final decoded = jsonDecode(encoded ?? '{}');

    final value = Map.of(decoded).cast<String, dynamic>();

    return QuizCollection.fromJson(value);
  }
}
