import 'package:flutter/material.dart';
import 'package:pocetak4/models/meal.dart';
import 'package:pocetak4/widgets/meal_item.dart';
import 'package:pocetak4/screens/meal_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  void pushToMealDetailScreen(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal)));
  }

  const MealsScreen({super.key, required this.title, required this.meals});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder:
            (item, index) => MealItem(
              meal: meals[index],
              mealTapped: (meal) {
                pushToMealDetailScreen(context, meal);
              },
            ),
      ),
    );
  }
}
