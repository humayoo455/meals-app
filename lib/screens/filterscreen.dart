import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class filterscreen extends StatefulWidget {
  const filterscreen({super.key, required this.selectedfilter});

  final Map<filter ,bool> selectedfilter;

  @override
  State<filterscreen> createState() => _filterscreenState();
}
enum filter {
  glutenfree,
  lactosefree,
  vegenfree
}



class _filterscreenState extends State<filterscreen> {

  var isgltenfree= false;
  var lactoseFree= false;
  var vegenFree= false;

  @override
  void initState() {

    super.initState();

    isgltenfree= widget.selectedfilter[filter.glutenfree]!;
    lactoseFree= widget.selectedfilter[filter.lactosefree]!;
    vegenFree= widget.selectedfilter[filter.vegenfree]!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FILTER SCREEN"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didpop,dynamic result){
          if(didpop)return;
          Navigator.of(context).pop({

             filter.glutenfree: isgltenfree,
            filter.lactosefree:lactoseFree,
            filter.vegenfree: vegenFree


          });
        },
        child: Column(
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
      ),
      
    );
  }
}
