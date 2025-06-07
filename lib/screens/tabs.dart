import 'package:flutter/material.dart';
import 'package:pocetak4/screens/categories_screen.dart';
import 'package:pocetak4/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    var activePageTitle = "Categories";

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(meals: []);
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
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
