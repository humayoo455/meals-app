import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';

class mealdetailCreen extends StatelessWidget {
  const mealdetailCreen({super.key, required this.ontogglefvtmeal, required this.meal});


final Meal meal;
final void Function(Meal meal) ontogglefvtmeal;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(onPressed: (){
          ontogglefvtmeal(meal);
        }
        , icon: Icon(Icons.star))
      ],
      ),
      body:
      SingleChildScrollView(
        child: Column(children: [
          Image.network(meal.imageUrl),
          
          Text("Ingrediaents.",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),

          for ( final ingredients in meal.ingredients)
            Text(ingredients,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.secondary)),

          SizedBox(height: 20,),

          Text('Steps',textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
          for( final steps in meal.steps)
            Text(steps,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.secondary))

        ],

    ),
      ),
    )

;  }
}
