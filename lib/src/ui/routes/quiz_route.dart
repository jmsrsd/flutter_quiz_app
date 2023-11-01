import 'package:go_router/go_router.dart';

import '../pages/quiz_page.dart';

GoRoute get quizRoute {
  return GoRoute(
    path: '/quiz',
    builder: (context, settings) {
      return const QuizPage();
    },
  );
}
