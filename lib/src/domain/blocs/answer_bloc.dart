import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerBloc extends Cubit<List<String>> {
  AnswerBloc() : super(const []);

  void set(List<String> value) {
    emit(value);
  }
}
