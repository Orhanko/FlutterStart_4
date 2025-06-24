import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocetak4/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text("Gluten Free"),
            subtitle: Text("Only include gluten-free meals"),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text("Lactose Free"),
            subtitle: Text("Only include lactose-free meals"),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text("Vegan"),
            subtitle: Text("Only include vegan meals"),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text("Vegetarian Filter"),
            subtitle: Text("Only include vegetarian meals"),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
