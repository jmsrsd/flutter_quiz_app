import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ShareButton({
    super.key,
    required this.onPressed,
  });

  @override
  build(context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.share),
      label: const Text('Share'),
    );
  }
}
