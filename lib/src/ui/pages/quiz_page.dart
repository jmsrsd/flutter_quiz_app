import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../common/models/quiz_collection.dart';
import '../../common/models/score_item.dart';
import '../../domain/blocs/score_bloc.dart';
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

  static const timerDuration = 5000.0;

  String? result;

  final options = <String>[];

  ScoreBloc get score {
    return context.read<ScoreBloc>();
  }

  double get now {
    return DateTime.now().millisecondsSinceEpoch.toDouble();
  }

  late double timer;

  late double time = now;

  double timerProgression = 0.0;

  void updateTimer() {
    timer = now + timerDuration;
  }

  void proceedThrough(List<Quiz> quizzes) {
    if (quizIndex + 1 >= quizzes.length) {
      context.go(resultRoute.path);

      return;
    }

    setState(() {
      quizIndex += 1;

      updateTimer();

      result = null;
    });
  }

  Stream<double> getTimerStream({required VoidCallback onTimeout}) async* {
    for (time = now; time <= timer; time = now) {
      await Future.delayed(Duration.zero);

      if (result != null) {
        return;
      }

      timerProgression = 1.0 - ((timer - time) / timerDuration);

      yield timerProgression;
    }

    if (result != null) {
      return;
    }

    onTimeout();
  }

  void showResult({
    required ScoreItem result,
    required List<Quiz> quizzes,
  }) {
    score.set([
      ...score.state,
      result,
    ]);

    setState(() {
      this.result = result.answer;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));

      proceedThrough(quizzes);
    });
  }

  @override
  initState() {
    super.initState();

    quizIndex = 0;

    score.set(const []);

    updateTimer();
  }

  @override
  build(context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;

    final topic = context.watch<TopicBloc>();

    final quizzes = topic.quizzes;

    final quiz = quizzes[quizIndex];

    final question = quiz.question;

    final answer = quiz.answer;

    final incorrects = answer?.incorrects ?? [];

    final correct = answer?.correct;

    if (result == null) {
      final randomized = [
        ...incorrects,
        correct,
      ].where((e) {
        return e != null;
      }).map((e) {
        return MapEntry(Random().nextDouble(), e as String);
      }).toList()
        ..sort((a, b) => a.key.compareTo(b.key));

      options
        ..clear()
        ..addAll(randomized.map((e) => e.value));
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
                  'Quiz',
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
          Container(
            color: const Color(0xFF2c436e),
            child: Builder(
              builder: (context) {
                Widget indicator(
                  BuildContext context, {
                  required double value,
                }) {
                  return LinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(
                      Color(0xFFfcd67e),
                    ),
                    value: value,
                  );
                }

                if (result != null) {
                  return indicator(
                    context,
                    value: timerProgression,
                  );
                }

                return StreamBuilder<double>(
                  stream: getTimerStream(onTimeout: () {
                    showResult(
                      result: ScoreItem(
                        question: '$question',
                        answer: '...',
                        isCorrect: false,
                      ),
                      quizzes: quizzes,
                    );
                  }),
                  builder: (context, snapshot) {
                    return indicator(
                      context,
                      value: snapshot.data ?? 0.0,
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 48,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 48 * 2,
                              child: Text(
                                '$question',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF232027),
                                ),
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
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
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
                                              'https://health.wyo.gov'
                                              '/wp-content/uploads/2017/05'
                                              '/question-mark-on-chalkboard.jpg';

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
                        ...options.map((option) {
                          Color backgroundColor = Colors.white;

                          if (option == result) {
                            backgroundColor =
                                option == correct ? Colors.green : Colors.red;
                          }

                          return [
                            const Gap(6),
                            AnimatedSwitcher(
                              duration: const Duration(seconds: 3),
                              child: FilledButton(
                                onPressed: result != null
                                    ? null
                                    : () {
                                        showResult(
                                          result: ScoreItem(
                                            question: '$question',
                                            answer: option,
                                            isCorrect: option == correct,
                                          ),
                                          quizzes: quizzes,
                                        );
                                      },
                                style: ButtonStyle(
                                  fixedSize: const MaterialStatePropertyAll(
                                    Size(double.maxFinite, 48),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    backgroundColor,
                                  ),
                                ),
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    color: Color(0xFF232027),
                                  ),
                                ),
                              ),
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
