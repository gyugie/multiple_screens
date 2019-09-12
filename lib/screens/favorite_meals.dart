import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteMeals extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoriteMeals(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
          child: Text('The Favorite Meals'),
      );
    } else {
      return ListView.builder(itemBuilder: (ctx, index){
          return MealItem(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageUrl: favoriteMeal[index].imageUrl,
              affordability: favoriteMeal[index].affordability,
              complexity: favoriteMeal[index].complexity,
              duration: favoriteMeal[index].duration,
            );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}