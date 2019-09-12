import 'package:flutter/material.dart';
import '../dummy_data.dart';

class DetailItem extends StatelessWidget {
  static const routName = '/detail-item';
  final Function toggleFavorite;
  final Function isFavoriteMeal;

  DetailItem(this.toggleFavorite, this.isFavoriteMeal);

  Widget buildSectionTitle(BuildContext context, String textTitle){
    return Container(
              margin: EdgeInsets.symmetric(vertical:10),
              child: Text(
                textTitle, 
                style: Theme.of(context).textTheme.title
                ),
            );
  }

  Widget buildContainer(Widget child){
    return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 300,
              child: child
          );
  }

  @override
  Widget build(BuildContext context) {
    final mealsId     = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal  = DUMMY_MEALS.firstWhere((meal) => meal.id == mealsId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                  ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index], style: Theme.of(context).textTheme.title,),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column( 
                    children:[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                          ),
                        title: Text(
                          selectedMeal.steps[index]
                          ),
                      ),
                      Divider(),
                      ],
                  ),
                itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavoriteMeal(mealsId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () => toggleFavorite(mealsId),
        ),
    );
  }
}