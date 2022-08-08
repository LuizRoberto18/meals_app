import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>? favoriteMeals;

  const FavoriteScreen({
    Key? key,
    this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isEmpty) {
      return Center(
        child: Text("Nenhuma receita foi marcada como faorita!"),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals!.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals![index]);
        },
      );
    }
  }
}
