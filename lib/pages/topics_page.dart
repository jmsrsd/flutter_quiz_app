import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/quiz_bloc.dart';
import '../components/buttons/topic_button.dart';
import '../components/gap.dart';
import '../routes/home_route.dart';
import '../routes/quiz_route.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({
    super.key,
  });

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  final search = TextEditingController();

  @override
  initState() {
    super.initState();

    search.addListener(() => setState(() {}));
  }

  @override
  dispose() {
    search.dispose();

    super.dispose();
  }

  @override
  build(context) {
    final bloc = context.watch<QuizBloc>();

    final state = bloc.state;

    if (state == null) {
      return Scaffold(
        body: FutureBuilder(
          future: bloc.fetch(),
          builder: (context, _) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    }

    final json = state.toJson();

    final topics = json.keys.where((k) {
      final query = search.text.trim();

      if (query.isEmpty) {
        return true;
      }

      return k.contains(query);
    }).toList();

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
                          context.go(homeRoute.path);
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
                    controller: search,
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
                    children: topics.isEmpty
                        ? []
                        : topics.map((e) {
                            return [
                              TopicButton(
                                label: e,
                                onPressed: () {
                                  context.go(quizRoute.path);
                                },
                              ),
                              const Gap(6),
                            ];
                          }).reduce((a, b) => [...a, ...b]),
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
