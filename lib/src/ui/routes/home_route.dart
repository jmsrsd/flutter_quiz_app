import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

GoRoute get homeRoute {
  return GoRoute(
    path: '/',
    builder: (context, settings) {
      return const HomePage();
    },
  );
}
