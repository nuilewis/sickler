import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sickler/global_components/snack_bar.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirestoreService({required this.uid});
  String uid;

////-------------------Adding UserProfile Info to Firestore---------------------
  addUserProfileInfo(
      {required String firstName,
      String? lastName,
      String? profileImg,
      required BuildContext context}) async {
    Map<String, dynamic> userProfile = {
      "firstName": firstName,
      "lastName": lastName,
      "uid": uid,
      "profileimg": profileImg,
    };

    Map<String, Map> userProfiletoUpload = {"profile": userProfile};

    //get profile info

      DocumentSnapshot docSnapshot = await _firestore
        .collection("users")
        .doc(uid)
      
        .get();

        


if(docSnapshot["profile"] !=null){
  //update data if it exist
   _firestore
        .collection("users")
        .doc(uid)
        .update(userProfiletoUpload)
            .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
} else{
  //add data if it does not exist
     _firestore
        .collection("users")
        .doc(uid)
        .set(userProfiletoUpload)
            .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
}
 
  }

////--------------------------Adding User Health info-----------------------------
  addUserHealthInfo(BuildContext context, {
    String? gender,
    int? age,
    double? height,
    double? weight,
    String? genotype,
  }) async {
    Map<String, dynamic> userHealth = {
      "gender": gender,
      "age": age,
      "height": height,
      "weight": weight,
      "genotype": genotype,
    };

    Map<String, Map> userHealthtoUpload = {"health": userHealth};

//Get document and check if data exist already and either add new data or update pre-existing data
        DocumentSnapshot docSnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .get();

        

        if(docSnapshot["health"] !=null){
//update data is heath data exist already
    _firestore
        .collection("users")
        .doc(uid)
        .update(userHealthtoUpload)
            .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
        } else{
          //add data if no data exist
    _firestore
        .collection("users")
        .doc(uid)
        .set(userHealthtoUpload)
            .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
        }


  }

  ////---------------------Adding Water Data to Firestore--------------------
  void addWaterData(BuildContext context,{int? amount, DateTime? time}) async {
    Map<String, dynamic> waterDataMap = {
      "volume": amount,
      "time": time,
    };

    ///Turning data into an array

    Map<String, dynamic> waterDataToUpload = {
      'water': FieldValue.arrayUnion([waterDataMap])
    };

//get doc id
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("tracking")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // update data
      DocumentSnapshot document = querySnapshot.docs[0];

      final String trackingDocID = document.id;

      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .doc(trackingDocID)
          .update(waterDataToUpload)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    } else {
//add data
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .add(waterDataToUpload)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    }
  }

  ///----------------Add Meds---------------------
  addMedsData(
    BuildContext context,
      {required String medName,
      int? medDose,
      int? daysLeft,
      int? medsMg,
      bool? recurring,
      String? frequency,
      List<DateTime>? time}) async {
    Map<String, dynamic> medsDataMap = {
      "drugName": medName,
      "drugDose": medDose,
      "daysleft": daysLeft,
      "drugMg": medsMg,
      "recurring": recurring,
      "frequency": frequency,
      "time": time,
    };

    Map<String, dynamic> medsDataToUplooad = {
      "meds": FieldValue.arrayUnion([medsDataMap])
    };

//get doc id
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("tracking")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // update data
      DocumentSnapshot document = querySnapshot.docs[0];

      final String trackingDocID = document.id;

      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .doc(trackingDocID)
          .update(medsDataToUplooad)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    } else {
//add data
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .add(medsDataToUplooad)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    }
  }

  ///--------------------------Add Crisis----------------------------
  addCrisis(
      BuildContext context, {required int painLevel, List<String>? painAreas, DateTime? time}) async {
    Map<String, dynamic> crisisDataMap = {
      "painLevel": painLevel,
      "painArea": painAreas,
      "time": time,
    };

    Map<String, dynamic> crisisDataToUplooad = {
      "crisis": FieldValue.arrayUnion([crisisDataMap])
    };

//get doc id
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("tracking")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // update data
      DocumentSnapshot document = querySnapshot.docs[0];

      final String trackingDocID = document.id;

      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .doc(trackingDocID)
          .update(crisisDataToUplooad)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    } else {
//add data
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .add(crisisDataToUplooad)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    }
  }

  ///-------------------------Add Oxygen----------------------------
  addOxygen(BuildContext context, {required int oxygenPercentage, DateTime? time}) async {
    Map<String, dynamic> oxygenDataMap = {
      "oxygen": oxygenPercentage,
      "time": time,
    };

    Map<String, dynamic> oxygenDataToUpload = {
      "oxygen": FieldValue.arrayUnion([oxygenDataMap])
    };

//get doc id
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("tracking")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // update data
      DocumentSnapshot document = querySnapshot.docs[0];

      final String trackingDocID = document.id;

      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .doc(trackingDocID)
          .update(oxygenDataToUpload)
              .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    } else {
//add data
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .add(oxygenDataToUpload)
        .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    }
  }

  ///----------------------Add HB------------------------------
  addHb(BuildContext context, {required double hbValue, DateTime? time}) async {
    Map<String, dynamic> hBDataMap = {
      "hb": hbValue,
      "time": time,
    };

    Map<String, dynamic> hBDataToUpload = {
      "hb": FieldValue.arrayUnion([hBDataMap])
    };

//get doc id
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("tracking")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // update data
      DocumentSnapshot document = querySnapshot.docs[0];

      final String trackingDocID = document.id;

      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .doc(trackingDocID)
          .update(hBDataToUpload)
          
     .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    } else {
//add data
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .add(hBDataToUpload)
        .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    }
  }

  ///-----------------------Add Nutrition-------------------------

  addNutrition(BuildContext context,
      {required String foodName, DateTime? time, double? estCalories}) async {
    Map<String, dynamic> nutritionDataMap = {
      "foodName": foodName,
      "time": time,
      "estCalories": estCalories,
    };

    Map<String, dynamic> nutritionDataToUpload = {
      "nutrition": FieldValue.arrayUnion([nutritionDataMap])
    };

//get doc id
    QuerySnapshot querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("tracking")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // update data
      DocumentSnapshot document = querySnapshot.docs[0];

      final String trackingDocID = document.id;

      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .doc(trackingDocID)
          .update(nutritionDataToUpload)
            .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    } else {
//add data
      _firestore
          .collection("users")
          .doc(uid)
          .collection("tracking")
          .add(nutritionDataToUpload)
          .then((value) {
        //print("upload profile data succesful");
        sicklerSnackBar(context, message: "Success", success: true);
      }).onError((error, stackTrace) {
       // print("upload profile info failed");
        sicklerSnackBar(context, message: "Failed", success: false);
      });
    }
  }
}
