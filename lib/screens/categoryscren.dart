import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:mealapp/screens/mealscreen.dart';

import '../category.dart';
import '../categorygriditem.dart';
import '../model/dummydata.dart';
import '../model/meal.dart';

class categoryscreen extends StatelessWidget {
  const categoryscreen({super.key, required this.ontogglefvt, required this.availablemeal});
  final void Function(Meal meal) ontogglefvt;
  final List<Meal> availablemeal;

  void _ontapcategory(BuildContext context,Category category){

    final filteredmeal = availablemeal.where((meal) =>
        meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
        mealscreen(
          title: category.title,
          meal: filteredmeal,
          ontogglefvt: ontogglefvt,))

    );

  }

  @override
  Widget build(BuildContext context) {
    return GridView(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,

          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),

      children: [

      for (final category in availableCategories)
        
        categoryitem(category: category,onselctcategory: (){
          _ontapcategory(context,category);
        },)
      ],
    );
  }
}
