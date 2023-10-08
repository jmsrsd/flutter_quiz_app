import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBloc extends Cubit<List<String>> {
  QuestionBloc() : super(const []);

  void set(List<String> value) {
    emit(value);
  }
}
