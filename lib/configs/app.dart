import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/answer_bloc.dart';
import '../blocs/question_bloc.dart';
import '../blocs/quiz_bloc.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuizBloc()),
        BlocProvider(create: (_) => QuestionBloc()),
        BlocProvider(create: (_) => AnswerBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Quiz App',
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
