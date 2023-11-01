import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/quiz_repository.dart';
import 'domain/blocs/quiz_bloc.dart';
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
        RepositoryProvider(create: (_) => QuizRepository()..init()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => QuizBloc.of(context)),
          BlocProvider(create: (context) => TopicBloc.of(context)),
        ],
        child: child,
      ),
    );
  }
}
