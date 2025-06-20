import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectListTile});

  final void Function(String identifer) onSelectListTile;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [Icon(Icons.fastfood, size: 48), Text("Cooking Up!")],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 26),
            title: Text("Meals"),
            onTap: () {
              onSelectListTile("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 26),
            title: Text("Filters"),
            onTap: () {
              onSelectListTile('filters');
            },
          ),
        ],
      ),
    );
  }
}
