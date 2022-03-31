import 'package:flutter/cupertino.dart';

import '../models/hb_model.dart';

class HbData extends ChangeNotifier {
  List<HbLog> totalHbList = [];
  double? averageHB = 0;
  double? sumOfHB = 0;

  void addHB(double HbValue) {
    totalHbList.add(HbLog(value: HbValue, time: DateTime.now()));

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
      sumOfHB = (sumOfHB! + hbLog.value!);
    }

    averageHB = sumOfHB! / totalHbList.length;

    notifyListeners();
  }

  void calcAverageOverTimeRange(){

  }
  
}
