import 'package:go_router/go_router.dart';

import '../pages/result_page.dart';

GoRoute get resultRoute {
  return GoRoute(
    path: '/result',
    builder: (context, settings) {
      return const ResultPage();
    },
  );
}
