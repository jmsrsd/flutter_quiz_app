import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlayButton({
    super.key,
    required this.onPressed,
  });

  @override
  build(context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(double.maxFinite, 48),
        ),
      ),
      child: const Text('PLAY'),
    );
  }
}
