import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';

import 'screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData tema = ThemeData();
  MyApp({Key? key}) : super(key: key);

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
        AppRoutes.home: (ctx) => TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(),
        AppRoutes.settings: (ctx) => SettingsScreen(),
      },
    );
  }
}
