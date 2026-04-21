import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class maindrawer extends StatelessWidget {
  const maindrawer({super.key ,required this.onselectscreen});
final void Function(String identifier) onselectscreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)

                  ],
                    begin: Alignment.center,
                    end: Alignment.topLeft
                  )

              ),
              child: Row(
                children: [
                  Icon(Icons.set_meal,size: 48,),
                  SizedBox(width: 18,),
                  Text("Cooking Up",style: Theme.of(context).textTheme.titleLarge?.copyWith(color:
                  Theme.of(context).colorScheme.primary
                  ),)
                ],
              )),
          ListTile(
            leading: Icon(Icons.restaurant, size: 28,),
            onTap: (){
              onselectscreen("meals");
            },
            title: Text("Meals",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryFixed),),
          ),
          ListTile(
            onTap: (){
              onselectscreen("filters");
            },
            leading: Icon(Icons.favorite, size: 28,),
            title: Text("Favourite",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryFixed),),
          ),


        ],
      ),

    );
  }
}
