import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/quiz_collection.dart';
import '../repositories/quiz_repository.dart';
import '../services/quiz_service.dart';

class QuizBloc extends Cubit<QuizCollection?> {
  final BuildContext context;

  QuizBloc.of(this.context) : super(null) {
    _fetchFromRepository();
  }

  QuizService get service {
    return QuizService.of(context);
  }

  QuizRepository get repository {
    return context.read<QuizRepository>();
  }

  Future<void> _fetchFromRepository() async {
    final data = await repository.get().then((json) {
      return QuizCollection.fromJson(json);
    });

    emit(data);
  }

  Future<bool> fetch() async {
    dynamic error;

    try {
      await service.collectQuiz();
    } catch (e, stackTrace) {
      error = e;

      debugPrint('$error');
      debugPrintStack(stackTrace: stackTrace);
    }

    _fetchFromRepository();

    return error == null;
  }
}
