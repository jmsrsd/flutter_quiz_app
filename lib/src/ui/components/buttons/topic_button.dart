import 'package:flutter/material.dart';

class TopicButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  TopicButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  build(context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.only(
            left: 12,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        fixedSize: const MaterialStatePropertyAll(
          Size(double.maxFinite, 48),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(label),
          ),
          const AspectRatio(
            aspectRatio: 1.0,
            child: Center(
              child: Icon(
                Icons.arrow_right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
