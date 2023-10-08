import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double dimension;

  const Gap(
    this.dimension, {
    super.key,
  });

  @override
  build(context) {
    return SizedBox.square(
      dimension: dimension,
    );
  }
}
