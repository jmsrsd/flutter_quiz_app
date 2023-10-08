import 'package:go_router/go_router.dart';

import '../routes/home_route.dart';
import '../routes/quiz_route.dart';
import '../routes/result_route.dart';
import '../routes/topics_route.dart';

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
