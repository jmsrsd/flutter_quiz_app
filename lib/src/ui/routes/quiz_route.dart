import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/topic_bloc.dart';
import '../pages/quiz_page.dart';
import 'home_route.dart';

Stream<String?> observeTopic(
  BuildContext context, {
  required TopicBloc topic,
}) async* {
  var isRunning = true;

  Future.delayed(const Duration(seconds: 3)).then((_) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (topic.quizzes.isNotEmpty) {
        isRunning = false;

        return;
      }

      context.go(homeRoute.path);
    });
  });

  while (true) {
    if (isRunning == false) {
      return;
    }

    await Future.delayed(Duration.zero);

    final isQuizzesEmpty = topic.quizzes.isEmpty;

    yield topic.state;

    if (isQuizzesEmpty == false) {
      return;
    }
  }
}

GoRoute get quizRoute {
  return GoRoute(
    path: '/quiz',
    builder: (context, settings) {
      final topic = context.read<TopicBloc>();

      return StreamBuilder(
        initialData: '*',
        stream: observeTopic(
          context,
          topic: topic,
        ),
        builder: (context, snapshot) {
          final isReady = snapshot.data != '*' && topic.quizzes.isNotEmpty;

          if (isReady) {
            return const QuizPage();
          }

          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    },
  );
}
