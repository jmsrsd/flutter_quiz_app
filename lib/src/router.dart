import 'package:go_router/go_router.dart';

import 'ui/routes/home_route.dart';
import 'ui/routes/quiz_route.dart';
import 'ui/routes/result_route.dart';
import 'ui/routes/topics_route.dart';

GoRouter get router {
  final result = GoRouter(
    initialLocation: homeRoute.path,
    routes: [
      homeRoute,
      topicsRoute,
      quizRoute,
      resultRoute,
    ],
  );

  return result;
}
