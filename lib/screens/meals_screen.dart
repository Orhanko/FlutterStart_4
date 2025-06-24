import 'package:flutter/material.dart';
import 'package:pocetak4/models/meal.dart';
import 'package:pocetak4/widgets/meal_item.dart';
import 'package:pocetak4/screens/meal_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  void pushToMealDetailScreen(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal)));
  }

  const MealsScreen({super.key, this.title, required this.meals});
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_outline_rounded, size: 64),
          Text("Oopss...", style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          Text(
            'List of favorite meals is empty!',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder:
            (item, index) => MealItem(
              meal: meals[index],
              mealTapped: (meal) {
                pushToMealDetailScreen(context, meal);
              },
            ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
