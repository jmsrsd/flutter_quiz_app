import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class QuizRepository {
  late LazyBox<String> _box;

  Future<void> init() async {
    _box = await Hive.openLazyBox('quiz');
  }

  Future<void> put(Map<String, dynamic> value) async {
    await init();

    await _box.put('*', jsonEncode(value));
  }

  Future<Map<String, dynamic>> get() async {
    await init();

    final encoded = await _box.get('*');
    final decoded = jsonDecode(encoded ?? '{}');

    return Map.of(decoded).cast<String, dynamic>();
  }
}
