import 'package:flutter/material.dart';

class TopicsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TopicsButton({
    super.key,
    required this.onPressed,
  });

  @override
  build(context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(double.maxFinite, 48),
        ),
      ),
      child: const Text('TOPICS'),
    );
  }
}
