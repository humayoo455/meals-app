import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/category.dart';

class categoryitem extends StatelessWidget {
   categoryitem({super.key, required this.category, required this.onselctcategory});
  final Category category;
  final void Function() onselctcategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onselctcategory,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [category.color.withOpacity(.55),category.color.withOpacity(0.9)
            , ],begin:Alignment.topRight,
            end: Alignment.bottomLeft)

          ),

              child: Text(category.title,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onBackground,), )
        ),
      ),
    );
  }
}
