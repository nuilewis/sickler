import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sickler/providers/user_provider.dart';
import 'package:sickler/services/firestore/firestore_service.dart';

import '../models/water_model.dart';

class WaterData extends ChangeNotifier {
  ///Units are in mililitres
  List<WaterLog> totalWaterList = [];
  List<WaterLog> totalWaterTodayList = [];
  int cupSize = 500;
  int dailyGoal = 3000;
  int totalWaterDrankToday = 0;
  int waterLeftToday = 0;
  int percentageCompleted = 0;
  double averageWaterOverTimeRange = 0;
  List<WaterLog> timeRangeList = [];


///Initialize water
void initWater(){
  if(totalWaterList.isEmpty){
 totalWaterList = [WaterLog(value: 0, time: DateTime.now())];
 totalWaterTodayList = [WaterLog(value: 0, time: DateTime.now())];
  }
  //notifyListeners();
}
  ///Calc Water dranktoday

  calWaterDrankToday() {
    totalWaterDrankToday = 0;
    for (WaterLog waterAmount in totalWaterTodayList) {
      totalWaterDrankToday = (totalWaterDrankToday + waterAmount.value);
    }

    waterLeftToday = dailyGoal - totalWaterDrankToday;

    notifyListeners();
  }

  ///calculate percentage Complete.

  caclPercentageCompleted() {
    percentageCompleted = (totalWaterDrankToday / dailyGoal * 100).toInt();

    // print("percentage completed is $percentageCompleted");
    //   print("total water drank today is $totalWaterDrankToday");

    notifyListeners();
  }

  ///Add Water Log
  addWaterLog(BuildContext context) {
    //add water to todays list
    totalWaterTodayList.add(WaterLog(value: cupSize, time: DateTime.now()));
    //add water to lifteimelist
    totalWaterList.add(WaterLog(value: cupSize, time: DateTime.now()));
    // print(totalWaterTodayList[0].amount);

    ///Add waterlog to Firebase
    FirestoreService(
            uid: Provider.of<SUserData>(context, listen: false).user.uid!)
        .addWaterData(context, amount: cupSize, time: DateTime.now());
    notifyListeners();
  }

  ///Delete last water log

  deleteLastWaterLog() {
    //remove last water added from today's list
    totalWaterTodayList.removeLast();
    //remove last water added from total list
    totalWaterList.removeLast();

    notifyListeners();
  }

  deleteWaterLog(int index) {
    //remove a particular wter log from today's list
    totalWaterList.removeAt(index);
    //remove a particular wter log from total list

    totalWaterTodayList.removeAt(index);
    notifyListeners();
  }

  changeCupSize(int newCupSize) {
    cupSize = newCupSize;
    notifyListeners();
  }

  ///Set Daily Goal
  setDailyGoal(double newDailyGoal) {
    if (newDailyGoal < 100) {
      dailyGoal = 1000 * newDailyGoal.toInt();
    }

    dailyGoal = newDailyGoal.toInt();
    notifyListeners();
  }

  void calcAverageOverTimeRange({required DateTime endDate, required int numDaysBeforeEndDate}) {


    
  DateTime startingDate = endDate.subtract( Duration(days: numDaysBeforeEndDate));
  DateTime endingDate = endDate;

  DateTimeRange timeRange = DateTimeRange(start: startingDate, end: endingDate);
    double waterSumOverTimeRange = 0;
//set time Range List to empty before calculating
    timeRangeList = [];

    for (WaterLog waterLog in totalWaterList) {
      if (waterLog.time.isAfter(timeRange.start) ||
          waterLog.time.isBefore(timeRange.end)) {
        //add to timeRange List
        timeRangeList.add(waterLog);
      }
    }

    ///Calculate Average over time range
    for (WaterLog waterLogTimeRange in timeRangeList) {
      waterSumOverTimeRange = waterSumOverTimeRange + waterLogTimeRange.value;
    }

    averageWaterOverTimeRange = waterSumOverTimeRange / timeRangeList.length;
  }
}
