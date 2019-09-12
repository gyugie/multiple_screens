import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List <Meal> displayMeals;
  var _loadedData = false;

  @override
  void initState(){

    super.initState();
  }

  @override
  void didChangeDependencies(){
        if(_loadedData == false){
          print(_loadedData);
            final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
              categoryTitle = routesArgs['title'];
            final categoryId  = routesArgs['id'];
                  displayMeals = DUMMY_MEALS.where((meal){
                return meal.categories.contains(categoryId);
            }).toList();  
          _loadedData = true;
        }
print('hi');
        super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.green,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
          return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              duration: displayMeals[index].duration,
              removeItem: _removeMeal,
            );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}