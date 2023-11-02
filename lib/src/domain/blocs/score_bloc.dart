import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/models/score_item.dart';

class ScoreBloc extends Cubit<List<ScoreItem>> {
  final BuildContext context;

  ScoreBloc.of(this.context) : super(const []);

  void set(List<ScoreItem> value) {
    emit(value);
  }

  int get correctCount {
    if (state.isEmpty) {
      return 0;
    }

    return state.where((e) => e.isCorrect).length;
  }
}
