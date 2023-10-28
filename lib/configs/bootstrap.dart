import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import 'app.dart';
import 'app_provider.dart';

Future<Widget> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return const AppProvider(
    child: App(),
  );
}
