import 'package:go_router/go_router.dart';

import '../pages/topics_page.dart';

final _route = GoRoute(
  path: '/topics',
  builder: (context, settings) {
    return const TopicsPage();
  },
);

GoRoute get topicsRoute {
  return _route;
}
