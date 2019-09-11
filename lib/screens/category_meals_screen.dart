import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';


class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routesArgs['title'];
    final categoryId  = routesArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
        return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.green,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
            );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}