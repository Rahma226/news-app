import 'package:flutter/material.dart';
import '../models/category_model.dart';
import 'category_card.dart';

class CategoriesList extends StatelessWidget {
  final Function(String) onCategorySelected;

  const CategoriesList({
    super.key,
    required this.onCategorySelected,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(category: 'top', image: 'assets/top.jpeg'),
    CategoryModel(category: 'business', image: 'assets/business.jpeg'),
    CategoryModel(category: 'health', image: 'assets/health.avif'),
    CategoryModel(category: 'sports', image: 'assets/sports.avif'),
    CategoryModel(category: 'entertainment', image: 'assets/entertaiment.avif'),
    CategoryModel(category: 'science', image: 'assets/science.avif'),
    CategoryModel(category: 'crime', image: 'assets/crime.jpeg'),
    CategoryModel(category: 'technology', image: 'assets/technology.jpeg'),
    CategoryModel(category: 'world', image: 'assets/general.avif'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CategoryCard(
              category: categories[index],
              onTap: onCategorySelected, // Pass selected category back
            ),
          );
        },
      ),
    );
  }
}
