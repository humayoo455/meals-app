
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/model/dummydata.dart';
import 'package:mealapp/model/main_drawer.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/screens/categoryscren.dart';
import 'package:mealapp/screens/filterscreen.dart';
import 'package:mealapp/screens/mealscreen.dart';
import 'package:mealapp/widgets/mealprovider.dart';

class tabs extends ConsumerStatefulWidget {
  const tabs({super.key});

  @override
  ConsumerState<tabs> createState() => _tabsState();
}
int activepageindex=0;
final Kinitialfiler={
  filter.vegenfree:false,
  filter.lactosefree:false,
  filter.glutenfree:false,
};


class _tabsState extends ConsumerState<tabs> {

  int activepageindex=0;
  final List<Meal> ontogalfvt=[];
  Map<filter, bool> filterresul=Kinitialfiler;


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

  void onselectscreen(String identifier) async {
    // 1. Close the drawer immediately
    Navigator.of(context).pop();

    if (identifier == "filters") {
      // 2. Wait for the result
      final result = await Navigator.of(context).push<Map<filter, bool>>(
        MaterialPageRoute(builder: (ctx) => filterscreen(selectedfilter: filterresul,)),
      );

      // 3. Check if the widget is still in the tree before using context again
      if (!mounted) return;

      setState(() {
        filterresul=result ?? Kinitialfiler;
      });
    } else if (identifier == "meals") {
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

    final meals= ref.watch(mealprovider);

    final availablrfilters= meals.where((meal){
      if(filterresul[filter.glutenfree]! && !meal.isGlutenFree)
      {return false;}
      if(filterresul[filter.lactosefree]! && !meal.isLactoseFree)
      {return false;}
      if(filterresul[filter.vegenfree]! && !meal.isVegan)
      {return false;}

      return true;
    }


    ).toList();
    Widget activscreen = categoryscreen(ontogglefvt: ontogalefvti, availablemeal: availablrfilters,);
    String activepagetitle= " ALL categories";

    if (activepageindex==1){
      activscreen= mealscreen(meal: ontogalfvt,ontogglefvt: ontogalefvti,);
      activepagetitle="FVT";

    }
    return Scaffold(
      drawer: maindrawer( onselectscreen: onselectscreen,),

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
