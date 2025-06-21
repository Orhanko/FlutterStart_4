import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() {
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeSet = false;
  var lactoseFreeSet = false;
  var veganSet = false;
  var vegetarianSet = false;
  @override
  void initState() {
    super.initState();
    glutenFreeSet = widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeSet = widget.currentFilters[Filter.lactoseFree]!;
    veganSet = widget.currentFilters[Filter.vegan]!;
    vegetarianSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeSet,
            Filter.lactoseFree: lactoseFreeSet,
            Filter.vegan: veganSet,
            Filter.vegetarian: vegetarianSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeSet = isChecked;
                });
              },
              title: Text("Gluten Free"),
              subtitle: Text("Only include gluten-free meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            SwitchListTile(
              value: lactoseFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeSet = isChecked;
                });
              },
              title: Text("Lactose Free"),
              subtitle: Text("Only include lactose-free meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            SwitchListTile(
              value: veganSet,
              onChanged: (isChecked) {
                setState(() {
                  veganSet = isChecked;
                });
              },
              title: Text("Vegan"),
              subtitle: Text("Only include vegan meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            SwitchListTile(
              value: vegetarianSet,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianSet = isChecked;
                });
              },
              title: Text("Vegetarian Filter"),
              subtitle: Text("Only include vegetarian meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}
