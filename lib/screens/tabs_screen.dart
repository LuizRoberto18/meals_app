import 'package:flutter/material.dart';
import 'categories_screen.dart';

import 'favorite_screen.dart';

import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_screens![_selectedScreenIndex]['title'] as String),
      ),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.copyWith().secondary,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.copyWith().primary,
            icon: const Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: 'Favoritos',
            backgroundColor: Theme.of(context).colorScheme.copyWith().primary,
          ),
        ],
      ),
    );
    /*return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: const Text("Vamos cozinhar?"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );*/
  }
}
