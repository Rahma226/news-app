import 'package:flutter/material.dart';
import '../widgets/news_list_view.dart';

class CategoryView extends StatelessWidget {
  final String category;

  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListView(category: category),
        ],
      ),
    );
  }
}
