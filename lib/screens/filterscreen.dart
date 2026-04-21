import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class filterscreen extends StatefulWidget {
  const filterscreen({super.key});

  @override
  State<filterscreen> createState() => _filterscreenState();
}
var isgltenfree= false;
var lactoseFree= true;
var vegenFree= false;

class _filterscreenState extends State<filterscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FILTER SCREEN"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.all(20),
            value: lactoseFree, onChanged: (ischecked){
            setState(() {
              lactoseFree= ischecked;
            });
          },
          subtitle: Text("only lactoseFree items inclued",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),),
          title:
          Text("Lactose Free",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary),),
          activeColor: (Theme.of(context).colorScheme.tertiary),),
          SwitchListTile(
            contentPadding: EdgeInsets.all(20),
            value: isgltenfree, onChanged: (ischecked){
            setState(() {
              isgltenfree= ischecked;
            });
          },
            subtitle: Text("only GlutenFree items inclued",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),),
            title:
            Text("GlutenFree",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary),),
            activeColor: (Theme.of(context).colorScheme.tertiary),),
          SwitchListTile(
            contentPadding: EdgeInsets.all(20),
            value: vegenFree, onChanged: (ischecked){
            setState(() {
              vegenFree= ischecked;
            });
          },
            subtitle: Text("only vegen items inclued",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),),
            title:
            Text("vegenFree",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary),),
            activeColor: (Theme.of(context).colorScheme.tertiary),),
        ],
      ),
      
    );
  }
}
