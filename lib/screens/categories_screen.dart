import 'package:pocetak4/models/category.dart';
import 'package:flutter/material.dart';
import 'package:pocetak4/models/data/dummy_data.dart';
import 'package:pocetak4/screens/meals_screen.dart';
import 'package:pocetak4/widgets/category_grid_item.dart';
import 'package:pocetak4/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  void pushToMeals(BuildContext context, Category category) {
    final filteredMeals =
        availableMeals
            .where((item) => item.categories.contains(category.id))
            .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  const CategoriesScreen({super.key, required this.availableMeals});
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onTapped: () {
              pushToMeals(context, category);
            },
          ),
      ],
    );
  }
}
