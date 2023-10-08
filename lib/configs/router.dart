import 'package:go_router/go_router.dart';

import '../uis/routes/home_route.dart';
import '../uis/routes/quiz_route.dart';
import '../uis/routes/result_route.dart';
import '../uis/routes/topics_route.dart';

final _router = GoRouter(
  initialLocation: homeRoute.path,
  routes: [
    homeRoute,
    topicsRoute,
    quizRoute,
    resultRoute,
  ],
);

GoRouter get router {
  return _router;
}
