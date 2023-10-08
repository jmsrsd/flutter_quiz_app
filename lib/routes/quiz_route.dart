import 'package:go_router/go_router.dart';

import '../pages/quiz_page.dart';

final _route = GoRoute(
  path: '/quiz',
  builder: (context, settings) {
    return const QuizPage();
  },
);

GoRoute get quizRoute {
  return _route;
}
