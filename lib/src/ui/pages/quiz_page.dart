import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/blocs/topic_bloc.dart';
import '../routes/home_route.dart';
import '../routes/result_route.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int quizIndex;

  @override
  initState() {
    super.initState();

    quizIndex = 0;
  }

  @override
  build(context) {
    final topic = context.watch<TopicBloc>();

    final quizzes = topic.quizzes;

    final quiz = quizzes[quizIndex];

    final answer = quiz.answer;

    final incorrects = answer?.incorrects ?? [];

    final correct = answer?.correct;

    final options = [
      ...incorrects,
      correct,
    ].where((e) {
      return e != null;
    }).map((e) {
      return MapEntry(Random().nextDouble(), e as String);
    }).toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text('Quiz'),
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
                    InkWell(
                      onTap: () {
                        context.go(homeRoute.path);
                      },
                      child: Container(
                        height: double.maxFinite,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: const Text('Exit'),
                      ),
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 48 * 7,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 48 * 2,
                              child: Text(
                                quiz.question ?? '',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      const fit = BoxFit.cover;
                                      const alignment = Alignment.center;
                                      const width = double.maxFinite;
                                      const height = double.maxFinite;

                                      return CachedNetworkImage(
                                        imageUrl: '${quiz.image}',
                                        fit: fit,
                                        alignment: alignment,
                                        width: width,
                                        height: height,
                                        errorWidget: (context, _, __) {
                                          const imageUrl =
                                              'https://health.wyo.gov/wp-content/uploads/2017/05/question-mark-on-chalkboard.jpg';

                                          return CachedNetworkImage(
                                            imageUrl: imageUrl,
                                            fit: fit,
                                            alignment: alignment,
                                            width: width,
                                            height: height,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                      if (options.isNotEmpty)
                        ...options.map((e) {
                          return e.value;
                        }).map((e) {
                          return [
                            const Gap(6),
                            FilledButton(
                              onPressed: () {
                                if (quizIndex + 1 >= quizzes.length) {
                                  context.go(resultRoute.path);

                                  return;
                                }

                                setState(() => quizIndex += 1);
                              },
                              style: const ButtonStyle(
                                fixedSize: MaterialStatePropertyAll(
                                  Size(double.maxFinite, 48),
                                ),
                              ),
                              child: Text(e),
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
