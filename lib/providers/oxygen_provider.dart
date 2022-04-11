import 'package:flutter/material.dart';
import '../models/oxygen_model.dart';

class OxygenData extends ChangeNotifier {
  List<OxygenLog> totalOxygenList = [];
  List<OxygenLog> timeRangeList = [];
  double? averageOxygen = 0;
  double? averageOxygenOverTimeRange = 0;
  double? sumOfOxygen = 0;

  void initOxygen(){
    if(totalOxygenList.isEmpty){
         totalOxygenList = [OxygenLog(value: 0, time: DateTime.now())];
          timeRangeList = [OxygenLog(value: 0, time: DateTime.now())];
    }
   /// notifyListeners();
  }

  void addOxygen(double oxygenValue) {
    totalOxygenList.add(OxygenLog(value: oxygenValue, time: DateTime.now()));

    notifyListeners();
  }

  void removeLatestOxygenLog() {
    totalOxygenList.removeLast();
    notifyListeners();
  }

  void removeHBlogAtIndex(int index) {
    totalOxygenList.removeAt(index);

    notifyListeners();
  }

  void calcAllTimeHbAvg() {
    for (OxygenLog hbLog in totalOxygenList) {
      sumOfOxygen = (sumOfOxygen! + hbLog.value);
    }



    averageOxygen = sumOfOxygen! / totalOxygenList.length;

    notifyListeners();
  }

  ///Calculate the Average Over a Time Range
  void calcAverageOverTimeRange({required DateTimeRange timeRange}) {
    double? oxygenSumOverTimeRange;
//set time Range List to empty before calculating
    timeRangeList = [];

    for (OxygenLog oxygenLog in totalOxygenList) {
      if (oxygenLog.time.isAfter(timeRange.start) ||
          oxygenLog.time.isBefore(timeRange.end)) {
        //add to timeRange List
        timeRangeList.add(oxygenLog);
      }
    }

    ///Calculate Average over time range
    for (OxygenLog oxygenLogTimeRange in timeRangeList) {
      oxygenSumOverTimeRange = oxygenSumOverTimeRange! + oxygenLogTimeRange.value;
    }

    averageOxygenOverTimeRange = oxygenSumOverTimeRange! / timeRangeList.length;

    notifyListeners();
  }

  
}
