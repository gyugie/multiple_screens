import 'package:flutter/material.dart';


class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routesArgs['title'];

    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.green,
        title: Text(categoryTitle),
      ),
      body: Text(categoryTitle),
    );
  }
}