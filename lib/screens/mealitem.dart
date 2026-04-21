import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/model/meal_item_trait.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class mealitem extends StatelessWidget {
  const mealitem({super.key, required this.meal, required this.onselectmeal} );

  final Meal meal;
  final void Function(Meal meal) onselectmeal;
  String get complextext {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordibilitytext {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(

        onTap: (){
          onselectmeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)
            ),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black54,
                  child:
                  Column(
                    children: [
                      Text(meal.title,style: TextStyle(color: Colors.white,fontSize: 20),
                        maxLines: 2
                        ,
                      softWrap: true,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          mealitemtrait(icon: Icons.schedule, label: '${meal.duration } min' ),
SizedBox(width: 20,),
                          mealitemtrait(icon: Icons.money, label: '$affordibilitytext ' ),

                          SizedBox(width: 20,),
                          mealitemtrait(icon: Icons.money, label: '$complextext ' ),
                        ],
                      )

                    ],

                  ),
                ))

          ],
        ),
      ),
    );
  }
}
