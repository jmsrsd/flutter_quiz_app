import 'package:flutter/material.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  build(context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
