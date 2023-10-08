import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/quiz_service.dart';
import '../components/buttons/rate_us_button.dart';
import '../components/buttons/share_button.dart';
import '../components/buttons/topics_button.dart';
import '../components/gap.dart';
import '../components/buttons/play_button.dart';
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
  initState() {
    super.initState();

    QuizService().collectQuiz();
  }

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

    const image = SizedBox.square(
      dimension: 240,
      child: Placeholder(),
    );

    final menu = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayButton(
          onPressed: () {
            context.push(quizRoute.path);
          },
        ),
        const Gap(6),
        TopicsButton(
          onPressed: () {
            context.push(
              topicsRoute.path,
            );
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
  }
}
