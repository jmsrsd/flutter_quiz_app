import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/answer_bloc.dart';
import '../blocs/question_bloc.dart';
import '../blocs/quiz_bloc.dart';

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({
    super.key,
    required this.child,
  });

  @override
  build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuizBloc()),
        BlocProvider(create: (_) => QuestionBloc()),
        BlocProvider(create: (_) => AnswerBloc()),
      ],
      child: child,
    );
  }
}
