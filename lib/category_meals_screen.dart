import 'package:flutter/material.dart';


class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  CategoryMealsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: categoryColor,
        title: Text(categoryTitle),
      ),
      body: Text(categoryTitle),
    );
  }
}