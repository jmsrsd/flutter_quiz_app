import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

final _route = GoRoute(
  path: '/',
  builder: (context, settings) {
    return const HomePage();
  },
);

GoRoute get homeRoute {
  return _route;
}
