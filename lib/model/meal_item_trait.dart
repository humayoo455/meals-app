import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mealitemtrait extends StatelessWidget {
  const mealitemtrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10,),
        Text(label,style: TextStyle(color: Colors.white),)

      ],
    );
  }
}
