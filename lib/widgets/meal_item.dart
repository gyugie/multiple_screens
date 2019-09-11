import 'package:flutter/material.dart';
import 'package:multiple_screens/widgets/detail_item.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return "Simple";
      break;
      case Complexity.Hard:
        return "Hard";
      break;
      case Complexity.Challenging:
        return "Challangging";
      break;
      default:
        return 'Unknown';
      break;
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
      break;
      case Affordability.Luxurious:
        return 'Luxurious';
      break;
      case Affordability.Pricey:
        return 'Price';
      break;
      default:
        return 'Unknown';
      break;
    }
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      DetailItem.routName,
      arguments:  id,
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                ),              
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20
                    ),
                    child: Text(
                      title, 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 24
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 10),
                      Text('${duration} min'),
                    ],
                  ),
                  Row(children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 10,),
                      Text(complexityText)
                    ],
                  ),
                  Row(children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 10,),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}