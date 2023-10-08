import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/gap.dart';
import '../routes/home_route.dart';
import '../routes/result_route.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    super.key,
  });

  @override
  build(context) {
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
                          context.pop();
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
                        height: 48 * 5,
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
                              height: 48,
                              child: const Text(
                                'Lorem ipsum dolor sit\n'
                                'Lorem ipsum dolor sit',
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
                                  child: const Placeholder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                      FilledButton(
                        onPressed: () {
                          context.go(resultRoute.path);
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(double.maxFinite, 48),
                          ),
                        ),
                        child: const Text('Hello, World!'),
                      ),
                      const Gap(6),
                      FilledButton(
                        onPressed: () {
                          context.go(resultRoute.path);
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(double.maxFinite, 48),
                          ),
                        ),
                        child: const Text('Hello, World!'),
                      ),
                      const Gap(6),
                      FilledButton(
                        onPressed: () {
                          context.go(resultRoute.path);
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(double.maxFinite, 48),
                          ),
                        ),
                        child: const Text('Hello, World!'),
                      ),
                      const Gap(6),
                      FilledButton(
                        onPressed: () {
                          context.go(resultRoute.path);
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(double.maxFinite, 48),
                          ),
                        ),
                        child: const Text('Hello, World!'),
                      ),
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
