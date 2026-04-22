import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/model/dummydata.dart';

final mealprovider= Provider((ref){
  return dummyMeals;
});