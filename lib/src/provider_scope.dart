import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/quiz_repository.dart';
import 'domain/blocs/quiz_bloc.dart';
import 'domain/blocs/score_bloc.dart';
import 'domain/blocs/topic_bloc.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;

  const ProviderScope({
    super.key,
    required this.child,
  });

  @override
  build(context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) {
          var theme = ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF13a6cd),
              primary: const Color(0xFF13a6cd),
              brightness: Brightness.dark,
              background: const Color(0xFF1c1d51),
              onSurface: Colors.white,
            ),
            useMaterial3: true,
          );

          return theme;
        }),
        RepositoryProvider(create: (_) => QuizRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => QuizBloc.of(context)),
          BlocProvider(create: (context) => TopicBloc.of(context)),
          BlocProvider(create: (context) => ScoreBloc.of(context)),
        ],
        child: child,
      ),
    );
  }
}
