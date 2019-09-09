import 'package:flutter/material.dart';
import './category_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Delimeals',
        theme: ThemeData(
          primarySwatch: Colors.green
        ),      
        home: CategoriesScreen(),
    );
  }
}
