
import 'package:flutter/material.dart';
import 'package:sickler/models/food_model.dart';

class FoodData extends ChangeNotifier{


List<FoodLog> foodLoglist = [];

void initFoof(){
  
foodLoglist = [FoodLog(foodName: "foodName")];
//notifyListeners();
}


void addFoodLog(FoodLog food){
  foodLoglist.add(food);
  notifyListeners();
}



void removeLastFoodlog(){
  foodLoglist.removeLast();

  notifyListeners();
}

void removeFoodlogAtIndex(int index){
  foodLoglist.removeAt(index);

  notifyListeners();
}
///Todo: find out how to calculate calories;
void calcCalories(){}


}