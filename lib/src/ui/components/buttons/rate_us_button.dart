import 'package:flutter/material.dart';

class RateUsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RateUsButton({
    super.key,
    required this.onPressed,
  });

  @override
  build(context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.star,
        color: Color(0xFFd2de2a),
      ),
      label: const Text(
        'Rate Us',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
