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
      icon: const Icon(
        Icons.share,
        color: Color(0xFF3d82f0),
      ),
      label: const Text(
        'Share',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
