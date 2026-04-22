import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/screens/categoryscren.dart';
import 'package:mealapp/widgets/tabs.dart';



final theme= ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Color.fromARGB(255, 131, 57, 0)
  ),
  textTheme: GoogleFonts.latoTextTheme()
);
void main (){
  runApp(ProviderScope(child: todoapp()));
}
class todoapp extends StatelessWidget {
  const todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(


        body: tabs(),
      ),
    );
  }
}
