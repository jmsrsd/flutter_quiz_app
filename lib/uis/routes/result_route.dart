import 'package:go_router/go_router.dart';

import '../pages/result_page.dart';

final _route = GoRoute(
  path: '/result',
  builder: (context, settings) {
    return const ResultPage();
  },
);

GoRoute get resultRoute {
  return _route;
}
