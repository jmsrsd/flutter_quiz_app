import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/topic_bloc.dart';
import '../pages/quiz_page.dart';
import 'home_route.dart';

GoRoute get quizRoute {
  return GoRoute(
    path: '/quiz',
    builder: (context, settings) {
      final topic = context.read<TopicBloc>();

      return StreamBuilder(
        initialData: '*',
        stream: (() async* {
          const step = 100;

          for (var ms = 0; ms < 3000; ms += step) {
            await Future.delayed(const Duration(milliseconds: step));

            yield topic.state;

            if (topic.quizzes.isNotEmpty) {
              yield topic.state;

              return;
            }
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (topic.quizzes.isNotEmpty) {
              return;
            }

            context.go(homeRoute.path);
          });
        })(),
        builder: (context, snapshot) {
          if (snapshot.data != '*' && topic.quizzes.isNotEmpty) {
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
