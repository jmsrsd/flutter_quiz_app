import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/quiz_bloc.dart';
import '../components/buttons/play_button.dart';
import '../components/buttons/rate_us_button.dart';
import '../components/buttons/share_button.dart';
import '../components/buttons/topics_button.dart';
import '../layouts/home_layout.dart';
import '../routes/quiz_route.dart';
import '../routes/topics_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  build(context) {
    const title = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Flutter Quiz App'),
        Gap(6),
        Text('Learn - Take Quiz - Repeat'),
      ],
    );

    final image = SizedBox.square(
      dimension: 240,
      child: Image.asset('assets/bulb.png'),
    );

    final menu = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayButton(
          onPressed: () {
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
    );

    final social = Row(
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
    );

    final quiz = context.read<QuizBloc>();

    return FutureBuilder(
      future: quiz.fetch(),
      builder: (context, snapshot) {
        return HomeLayout(
          children: [
            const Gap(48),
            image,
            const Gap(48),
            title,
            const Gap(48),
            menu,
            const Gap(48),
            social,
            const Gap(48),
          ],
        );
      },
    );
  }
}
