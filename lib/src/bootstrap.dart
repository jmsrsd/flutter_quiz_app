import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../firebase_options.dart';
import 'app.dart';
import 'provider_scope.dart';

Future<Widget> bootstrap() async {
  /// Returns an instance of the binding that implements [WidgetsBinding].
  ///
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializes a new [FirebaseApp] instance.
  ///
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Initializes Hive with the path from [getApplicationDocumentsDirectory].
  ///
  await Hive.initFlutter('flutter_quiz_app');

  /// Use the [PathUrlStrategy] to handle the browser URL.
  ///
  usePathUrlStrategy();

  return const ProviderScope(
    child: App(),
  );
}
