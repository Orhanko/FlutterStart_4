import 'package:flutter/material.dart';
import 'package:pocetak4/models/data/dummy_data.dart';
import 'package:pocetak4/screens/categories_screen.dart';
import 'package:pocetak4/screens/filters_screen.dart';
import 'package:pocetak4/screens/meals_screen.dart';
import 'package:pocetak4/models/meal.dart';
import 'package:pocetak4/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  Map<Filter, bool> selectedFilters = kInitialFilter;
  final List<Meal> favoriteMeals = [];

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? kInitialFilter;
      });
    }
  }

  void toggleFavoriteMeal(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Removed Successfully'),
                content: Text(
                  '${meal.title} has been removed from the list of favorite items!',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Added Successfully'),
                content: Text(
                  '${meal.title} has been added into the list of favorite items!',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals =
        dummyMeals.where((meal) {
          if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }
          if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }
          if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
    Widget activePage = CategoriesScreen(
      onFavoteTapped: toggleFavoriteMeal,
      availableMeals: availableMeals,
    );
    var activePageTitle = "Categories";

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeals,
        onFavoriteTapped: toggleFavoriteMeal,
      );
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectListTile: setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal, semanticLabel: "Categories"),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, semanticLabel: "Favorites"),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
