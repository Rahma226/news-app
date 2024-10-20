import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/services/new_service.dart';
import '../models/results_model.dart';
import 'news_list.dart';

class NewsListView extends StatefulWidget {
  final String category;

  const NewsListView({super.key, required this.category});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<List<ResultsModel>> future;

  @override
  void initState() {
    super.initState();
    _fetchNews(); // Fetch news by category when initialized
  }

  @override
  void didUpdateWidget(covariant NewsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.category != oldWidget.category) {
      print('Category changed to: ${widget.category}'); // Log category change
      _fetchNews(); // Fetch news again when the category changes
    }
  }

  void _fetchNews() {
    setState(() {
      future = NewsService(Dio())
          .getNewsByCategory(widget.category); // Fetch news by category
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ResultsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsList(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Oops! There was an error.')),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
