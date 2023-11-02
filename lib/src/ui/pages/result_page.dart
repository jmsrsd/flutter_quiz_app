import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/score_bloc.dart';
import '../routes/home_route.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
  });

  @override
  build(context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;

    final score = context.watch<ScoreBloc>();

    final results = score.state;

    final correctCount = score.correctCount;

    final scoring = results.isEmpty
        ? 0.0
        : correctCount.toDouble() / results.length.toDouble();

    if (results.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(homeRoute.path);
      });
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Your Score',
                  style: textTheme.titleMedium,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: InkWell(
                        onTap: () {
                          context.go(homeRoute.path);
                        },
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 6,
                bottom: 12,
              ),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: SizedBox(
                  width: 320,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        child: SizedBox.square(
                          dimension: 120,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const SizedBox.expand(
                                child: CircularProgressIndicator(
                                  value: 1.0,
                                  valueColor: AlwaysStoppedAnimation(
                                    Color(0xFF5d5c5d),
                                  ),
                                ),
                              ),
                              SizedBox.expand(
                                child: Transform.scale(
                                  scaleX: -1,
                                  child: CircularProgressIndicator(
                                    value: scoring,
                                    valueColor: const AlwaysStoppedAnimation(
                                      Color(0xFF6dd382),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '$correctCount / ${results.length}',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(24),
                      Container(
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Share your score'),
                        ),
                      ),
                      Container(
                        height: 48 * 2,
                        alignment: Alignment.center,
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          child: Text(
                            'Your Report',
                            style: textTheme.titleMedium,
                          ),
                        ),
                      ),
                      if (results.isNotEmpty)
                        ...results.map((e) {
                          return [
                            const Gap(24),
                            Text(e.question),
                            const Gap(12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(e.isCorrect ? Icons.check : Icons.close),
                                const Gap(12),
                                Text(e.answer),
                              ],
                            ),
                          ];
                        }).reduce((a, b) {
                          return [...a, ...b];
                        }).sublist(1),
                    ],
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
