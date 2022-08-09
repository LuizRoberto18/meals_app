import 'package:flutter/material.dart';
import 'package:meals/screens/home_page_screen.dart';

import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';

import 'utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData tema = ThemeData();
  Settings settigns = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settigns = settings;
      _availableMeals = dummyMeals.where((meal) {
        final fillterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final fillterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final fillterVegan = settings.isVegan && !meal.isVegan;
        final fillterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !fillterGluten &&
            !fillterLactose &&
            !fillterVegan &&
            !fillterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: Colors.black,
        scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: CategoriesScreen(),
      routes: {
        AppRoutes.home: (ctx) => HomePageScreen(),
        AppRoutes.mainHome: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: isFavorite,
            ),
        AppRoutes.settings: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settigns,
            ),
      },
    );
  }
}
