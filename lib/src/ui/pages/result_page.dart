import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/topic_bloc.dart';
import '../routes/home_route.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
  });

  @override
  build(context) {
    final topic = context.watch<TopicBloc>();

    final quizzes = topic.quizzes;

    final answers = quizzes.map((e) => e.answer).toList();

    final corrects = answers.map((e) => e?.correct).toList();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text('Your Score'),
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
                          child: Icon(Icons.arrow_back_ios_outlined),
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
                        child: const SizedBox.square(
                          dimension: 120,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox.expand(
                                child: CircularProgressIndicator(
                                  value: 1.0,
                                ),
                              ),
                              Text(
                                '4 / 5',
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
                      const Gap(12),
                      Container(
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: const Text('Your Report'),
                      ),
                      if (quizzes.isNotEmpty)
                        ...quizzes.map((e) {
                          return [
                            const Gap(12),
                            Text('${e.question}'),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.check),
                                Text('Foo Bar'),
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
