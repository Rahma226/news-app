import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';
import '../widgets/categories_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = 'top'; // Default category

  // Callback when a category is selected
  void onCategorySelected(String category) {
    setState(() {
      print('Category selected: $category'); // Log the selected category
      selectedCategory = category; // Update the selected category
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News'),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesList(
                onCategorySelected: onCategorySelected, // Pass callback
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            NewsListView(category: selectedCategory), // Pass the selected category to update the list
          ],
        ),
      ),
    );
  }
}
