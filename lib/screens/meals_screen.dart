import 'package:flutter/material.dart';
import 'package:pocetak4/models/meal.dart';
import 'package:pocetak4/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealsScreen({super.key, required this.title, required this.meals});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (item, index) => MealItem(meal: meals[index]),
      ),
    );
  }
}
