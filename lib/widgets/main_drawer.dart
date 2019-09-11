import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon){
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
            onTap: (){},
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
          buildListTile('Meals', Icons.restaurant),
          buildListTile('Fillters', Icons.settings)
        ],
      ),
    );
  }
}