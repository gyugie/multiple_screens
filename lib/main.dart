import 'package:flutter/material.dart';
import './category_meals_screen.dart';
import './category_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          '/' : (ctx) => CategoriesScreen(),
          CategoryMealsScreen.routName : (ctx) => CategoryMealsScreen()
        },
    );
  }
}
