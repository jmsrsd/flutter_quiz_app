import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final List<Widget> children;

  const HomeLayout({
    super.key,
    required this.children,
  });

  @override
  build(context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Container(
                  width: 320,
                  decoration: BoxDecoration(
                    /// The border property below is used for debugging
                    /// purposes.
                    ///
                    /// Change the its color beside transparent in order to
                    /// see the max width of the app.
                    ///
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
