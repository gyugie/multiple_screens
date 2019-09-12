import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'screens/filters.dart';
import 'screens/tabs_screen.dart';
import 'widgets/detail_item.dart';
import 'screens/category_meals_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData){
    setState(() {
    
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Delimeals',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
            ),
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 14,
              fontWeight: FontWeight.bold
            )
          )
        ),      
        // home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/' : (ctx) => TabsScreen(),
          CategoryMealsScreen.routName : (ctx) => CategoryMealsScreen(_availableMeals),
          DetailItem.routName : (ctx) => DetailItem(),
          FiltersScreen.routeName : (ctx) => FiltersScreen(_filters,_setFilters),
        },
        onGenerateRoute: (settings){
          print(settings.arguments);
          // if(settings.name == '/detail-item'){
          //   return ...;
          // } else if(settings.name == '/something-else'){
          //   return ...;
          // }
          // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
        onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx) => TabsScreen());
        },
    );
  }
}
