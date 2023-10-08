import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/quiz_collection.dart';

class QuizBloc extends Cubit<QuizCollection?> {
  QuizBloc() : super(null);

  void set(QuizCollection? value) {
    emit(value);
  }
}
