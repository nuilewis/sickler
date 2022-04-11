import 'package:flutter/material.dart';
import 'package:sickler/models/meds_model.dart';

class MedsData extends ChangeNotifier {

List<MedsLog> medsList = [];


void initMeds(){
if(medsList.isEmpty){
   medsList = [MedsLog(name: "name", dose: 200, daysLeft: 12, time: [DateTime.now()])];
}
//notifyListeners();
}

void addMeds({required MedsLog medicine}){

  medsList.add(medicine);

  notifyListeners();
}

void removeLastMed(){


  medsList.removeLast;

  notifyListeners();

}

void removeMedsAtIndex( int index){


  medsList.removeAt(index);

  notifyListeners();

}

///Resets the status of a drug if taken wo false when the next day reaches

void resetMedsTakenForNextDay( int index){

medsList[index].taken = false;


  

  notifyListeners();
}







}