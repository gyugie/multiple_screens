import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
   static const routeName = 'Filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool _isGlutenFree = false;
   bool _isVegan = false;
   bool _isVegetarian = false;
   bool _isLactoseFree = false;

   Widget _buildSwitchListTile(
     String title, 
     String description, 
     bool currentValue, 
     Function updateValue
     ){
          return SwitchListTile(
                  title: Text(title,  style: TextStyle(fontWeight: FontWeight.bold)),
                  value: currentValue,
                  subtitle: Text(description, style: TextStyle(fontFamily: 'RobotoCondensed')),
                  onChanged: updateValue,
                );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filltering',
              style: Theme.of(context).textTheme.title,
              ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'only include gluten free meals',
                  _isGlutenFree,
                    (newValue){
                        setState((){
                        _isGlutenFree = newValue; 
                      },
                    );
                  }
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'only include Lactose free meals',
                  _isVegan,
                    (newValue){
                        setState((){
                        _isVegan = newValue; 
                      },
                    );
                  }
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'only include vegetarian free meals',
                  _isVegetarian,
                    (newValue){
                        setState((){
                        _isVegetarian = newValue; 
                      },
                    );
                  }
                ),
              _buildSwitchListTile(
                  'Vegan',
                  'only include vegan free meals',
                  _isLactoseFree,
                    (newValue){
                        setState((){
                        _isLactoseFree = newValue; 
                      },
                    );
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}