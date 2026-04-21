import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/mealitem.dart';

import '../model/meal.dart';

class mealscreen extends StatelessWidget {
  const mealscreen({super.key,this.title, required this.meal, required this.ontogglefvt});
  final String? title;
  final List<Meal> meal;
  final void Function(Meal meal) ontogglefvt;
  void onseltectmeal(BuildContext context, Meal meal){
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>mealdetailCreen(ontogglefvtmeal: ontogglefvt, meal: meal)));
  }

  @override
  Widget build(BuildContext context) {

    // if (meal.isEmpty){
    //   content= Center(child: Text("No DATA"),);
    // }
    if( title== null){
      return ListView.builder(
          itemCount: meal.length,
          itemBuilder: (ctx,index)=> mealitem(meal: meal[index], onselectmeal: (meal){
            onseltectmeal(context, meal);
          },)
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),

      body:ListView.builder(
    itemCount: meal.length,
        itemBuilder: (ctx,index)=> mealitem(meal: meal[index], onselectmeal: (meal){
          onseltectmeal(context, meal);
        },)
      )
        );

  }
}
