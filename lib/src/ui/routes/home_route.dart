import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/topic_bloc.dart';
import '../components/buttons/play_button.dart';
import '../components/buttons/rate_us_button.dart';
import '../components/buttons/share_button.dart';
import '../components/buttons/topics_button.dart';
import '../pages/home_page.dart';
import 'quiz_route.dart';
import 'topics_route.dart';

GoRoute get homeRoute {
  return GoRoute(
    path: '/',
    builder: (context, settings) {
      final topic = context.read<TopicBloc>();

      return HomePage(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Flutter Quiz App'),
            Gap(6),
            Text('Learn - Take Quiz - Repeat'),
          ],
        ),
        image: SizedBox.square(
          dimension: 240,
          child: Image.asset('assets/bulb.png'),
        ),
        menu: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            PlayButton(
              onPressed: () {
                topic.set(null);

                context.go(quizRoute.path);
              },
            ),
            const Gap(6),
            TopicsButton(
              onPressed: () {
                context.go(topicsRoute.path);
              },
            ),
          ],
        ),
        social: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShareButton(
              onPressed: () {},
            ),
            const Gap(48),
            RateUsButton(
              onPressed: () {},
            ),
          ],
        ),
      );
    },
  );
}
