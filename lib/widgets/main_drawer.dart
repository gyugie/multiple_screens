import 'package:flutter/material.dart';
import 'package:multiple_screens/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
                fontSize: 20
                ),
              ),
            onTap: tapHandler,
          );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.greenAccent,
            child: Text(
              'Cookin Up!', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color:Theme.of(context).primaryColor
              )
            ),
          ),
          SizedBox(height: 10),
          buildListTile(
            'Meals', 
            Icons.restaurant,
            (){
              Navigator.of(context).pushNamed('/');
            }
          ),
          buildListTile(
            'Fillters',
            Icons.settings,
            (){
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}