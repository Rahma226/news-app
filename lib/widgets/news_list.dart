import 'package:flutter/material.dart';
import '../models/results_model.dart';
import 'news_tile.dart';

class NewsList extends StatelessWidget {
  final List<ResultsModel> articles;

  const NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: NewsTile(resultModel: articles[index]),
          );
        },
      ),
    );
  }
}
