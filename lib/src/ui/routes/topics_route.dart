import 'package:go_router/go_router.dart';

import '../pages/topics_page.dart';

GoRoute get topicsRoute {
  return GoRoute(
    path: '/topics',
    builder: (context, settings) {
      return const TopicsPage();
    },
  );
}
