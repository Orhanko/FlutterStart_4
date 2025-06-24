import 'package:flutter/material.dart';
import 'package:pocetak4/providers/favorites_provider.dart';
import 'package:pocetak4/providers/meals_provider.dart';
import 'package:pocetak4/screens/categories_screen.dart';
import 'package:pocetak4/screens/filters_screen.dart';
import 'package:pocetak4/screens/meals_screen.dart';
import 'package:pocetak4/models/meal.dart';
import 'package:pocetak4/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  Map<Filter, bool> selectedFilters = kInitialFilter;

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

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals =
        meals.where((meal) {
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
    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    var activePageTitle = "Categories";

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
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
