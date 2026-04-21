
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/model/main_drawer.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/screens/categoryscren.dart';
import 'package:mealapp/screens/filterscreen.dart';
import 'package:mealapp/screens/mealscreen.dart';

class tabs extends StatefulWidget {
  const tabs({super.key});

  @override
  State<tabs> createState() => _tabsState();
}
int activepageindex=0;


class _tabsState extends State<tabs> {

  int activepageindex=0;
  final List<Meal> ontogalfvt=[];
  void Showsnakbad(String text){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
  void ontogalefvti (Meal meal){
    

    final ifexisting = ontogalfvt.contains(meal);
    if(ifexisting){
      setState(() {
        ontogalfvt.remove(meal);
        Showsnakbad("Hello its removed");
      });

    }
    else
      {
        setState(() {
          ontogalfvt.add(meal);
          Showsnakbad("Hello its addded");
        });
      }
  }

void oonselectscreen(String identifier){
  Navigator.of(context).pop();
    if(identifier=="filters"){
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> filterscreen()));

    }
  if(identifier=="meals"){
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> tabs()));

  }


}
  void selectpage (int index ){
setState(() {
  activepageindex=index;
});
  }
  @override
  Widget build(BuildContext context) {
    Widget activscreen = categoryscreen(ontogglefvt: ontogalefvti);
    String activepagetitle= " ALL categories";

    if (activepageindex==1){
      activscreen= mealscreen(meal: ontogalfvt,ontogglefvt: ontogalefvti,);
      activepagetitle="FVT";

    }
    return Scaffold(
      drawer: maindrawer( onselectscreen: oonselectscreen,),

      appBar: AppBar(
        title:Text(activepagetitle),
      ),

      body: activscreen,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activepageindex,
        onTap: selectpage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "category"),
        BottomNavigationBarItem(icon: Icon(Icons.eighteen_mp,),label: "FVT",),
      ]
      ),
    );
  }
}
