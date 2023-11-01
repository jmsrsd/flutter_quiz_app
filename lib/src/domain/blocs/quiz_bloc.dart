import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/models/quiz_collection.dart';
import '../../data/repositories/quiz_repository.dart';

class QuizBloc extends Cubit<QuizCollection> {
  final BuildContext context;

  QuizBloc.of(this.context) : super(const QuizCollection()) {
    fetch();
  }

  QuizRepository get repository {
    return context.read<QuizRepository>();
  }

  Future<bool> fetch() async {
    dynamic error;

    try {
      await repository.get().then(emit);
    } catch (e, stackTrace) {
      error = e;

      debugPrint('$error');
      debugPrintStack(stackTrace: stackTrace);
    }

    return error == null;
  }

  List<String> get topics {
    return state.toJson().keys.toList();
  }
}
