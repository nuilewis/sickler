import 'package:flutter/material.dart';
import '../models/hb_model.dart';

class HbData extends ChangeNotifier {
  List<HbLog> totalHbList = [];
  List<HbLog> timeRangeList = [];
  double? averageHB = 0;
  double? averageHBOverTimeRange = 0;
  double? sumOfHB = 0;

void initHb(){
  if(totalHbList.isEmpty){
      totalHbList = [HbLog(value: 0, time: DateTime.now())];
timeRangeList = [HbLog(value: 0, time: DateTime.now())];
  }

  //notifyListeners();
}



  void addHB(double hbValue) {
    totalHbList.add(HbLog(value: hbValue, time: DateTime.now()));

    notifyListeners();
  }

  void removeLatestHBLog() {
    totalHbList.removeLast();
    notifyListeners();
  }

  void removeHBlogAtIndex(int index) {
    totalHbList.removeAt(index);

    notifyListeners();
  }

  void calcAllTimeHbAvg() {
    for (HbLog hbLog in totalHbList) {
      sumOfHB = (sumOfHB! + hbLog.value);
    }



    averageHB = sumOfHB! / totalHbList.length;

    notifyListeners();
  }

  ///Calculate the Average Over a Time Range
  void calcAverageOverTimeRange({required DateTime endDate, required int numDaysBeforeEndDate}) {


  DateTime startingDate = endDate.subtract( Duration(days: numDaysBeforeEndDate));
  DateTime endingDate = endDate;

  DateTimeRange timeRange = DateTimeRange(start: startingDate, end: endingDate);


    double hbSumOverTimeRange = 0;
//set time Range List to empty before calculating
    timeRangeList = [];

    for (HbLog hbLog in totalHbList) {
      if (hbLog.time.isAfter(timeRange.start) &&
          hbLog.time.isBefore(timeRange.end)) {
        //add to timeRange List
        timeRangeList.add(hbLog);
      }
    }

    ///Calculate Average over time range
    for (HbLog hbLogTimeRange in timeRangeList) {
      hbSumOverTimeRange = hbSumOverTimeRange+ hbLogTimeRange.value;
    }

    averageHBOverTimeRange = hbSumOverTimeRange/ timeRangeList.length;

    notifyListeners();
  }
}
