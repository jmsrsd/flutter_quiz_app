import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/buttons/topic_button.dart';
import '../components/gap.dart';
import '../routes/quiz_route.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({
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
                const Text('Topics'),
                Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 320,
                  height: double.maxFinite,
                  child: TextField(
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(
                        minWidth: double.maxFinite,
                        minHeight: double.maxFinite,
                      ),
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(6),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopicButton(
                        label: 'politics',
                        onPressed: () {
                          context.push(quizRoute.path);
                        },
                      ),
                      const Gap(6),
                      TopicButton(
                        label: 'animals',
                        onPressed: () {
                          context.push(quizRoute.path);
                        },
                      ),
                      const Gap(6),
                      TopicButton(
                        label: 'gk',
                        onPressed: () {
                          context.push(quizRoute.path);
                        },
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
