import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      theme: context.read<ThemeData>(),
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
