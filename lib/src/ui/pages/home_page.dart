import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../layouts/home_layout.dart';

class HomePage extends StatelessWidget {
  final Widget image;
  final Widget title;
  final Widget menu;
  final Widget social;

  const HomePage({
    super.key,
    required this.image,
    required this.title,
    required this.menu,
    required this.social,
  });

  @override
  build(context) {
    return HomeLayout(
      children: [
        const Gap(48),
        image,
        const Gap(48),
        title,
        const Gap(48),
        menu,
        const Gap(48),
        social,
        const Gap(48),
      ],
    );
  }
}
