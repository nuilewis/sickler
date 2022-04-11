import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/appbar.dart';
import 'package:sickler/providers/hb_provider.dart';
import 'package:sickler/providers/meds_provider.dart';
import 'package:sickler/providers/oxygen_provider.dart';
import 'package:sickler/providers/user_provider.dart';
import 'package:sickler/providers/water_provider.dart';
import 'package:sickler/screens/medsscreen/meds_screen.dart';
import 'package:sickler/screens/hbscreen/hb_screen.dart';
import 'package:sickler/screens/homescreen/components/medicine_card.dart';
import 'package:sickler/screens/homescreen/components/stats_card.dart';
import 'package:sickler/screens/homescreen/components/water_card.dart';
import 'package:sickler/screens/waterscreen/water_screen.dart';
import 'package:sickler/size_config.dart';
import 'components/recommendation_card.dart';
import 'package:provider/provider.dart';

class SicklerHomeScreen extends StatefulWidget {
  static const String id = "SicklerHomeScreen";

  const SicklerHomeScreen({Key? key}) : super(key: key);

  @override
  _SicklerHomeScreenState createState() => _SicklerHomeScreenState();
}

class _SicklerHomeScreenState extends State<SicklerHomeScreen> {




  @override
  Widget build(BuildContext context) {
//double? waterDrankToday = (Provider.of<WaterData>(context).totalWaterDrankToday.toDouble()/1000) ?? 0;
//DateTime? lastWaterLogTime = Provider.of<WaterData>(context).totalWaterTodayList.last.time;


    return Consumer5<SUserData, WaterData, HbData, OxygenData, MedsData>(
      builder:
          ((context, userData, waterData, hbData, oxygenData, medsData, child) {
        ///initialize all data in case values are null

        waterData.initWater();
        hbData.initHb();
        oxygenData.initOxygen();
        medsData.initMeds();

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const SicklerAppBar(showBackButton: false),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: kDefaultPadding, top: kDefaultPadding2x * 2),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kDark20,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(height: relHeight(kDefaultPadding2x, context)),
                  Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good morning",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          userData.user.firstName!,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///Recommendation Card
                  const RecommendationCard(
                      title: "You haven't been following your regimen.",
                      description:
                          "You should drink more water and don't forget to take your medicines."),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding, top: kDefaultPadding2x),
                    child: Text(
                      "At a Glance",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),

                  ///Statistics Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatsCard(
                        iconLink: "assets/svg/water_drop.svg",
                        statsTitle: "Water",
                        statsValue: ((waterData.totalWaterDrankToday
                                    .toDouble()) /
                                1000)
                            .toStringAsFixed(1), //to convert from ml to litres
                        statsUnit: "Litres",
                        statsTimestamp:TimeOfDay.fromDateTime(waterData.totalWaterList.last.time).format(context) ,
                        colour: kBlue,
                        bgColour: kBlue20,
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Feedback.forTap(context);
                          Navigator.pushNamed(context, WaterScreen.id);
                        },
                      ),
                      StatsCard(
                        iconLink: "assets/svg/hb_icon.svg",
                        statsTitle: "Hb",
                        statsValue:
                            hbData.totalHbList.last.value.toStringAsFixed(1),
                        statsUnit: "g/dl",
                        statsTimestamp:
                            TimeOfDay.fromDateTime(hbData.totalHbList.last.time).format(context),
                                
                        colour: kFuchsia,
                        bgColour: kFuchsia20,
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Feedback.forTap(context);
                          Navigator.pushNamed(context, HbScreen.id);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatsCard(
                        iconLink: "assets/svg/o2_icon.svg",
                        statsTitle: "Oxygen",
                        statsValue:
                            oxygenData.totalOxygenList.last.value.toInt().toString(),
                        statsUnit: "%",
                        statsTimestamp: TimeOfDay.fromDateTime(
                                oxygenData.totalOxygenList.last.time).format(context),
                          
                        colour: kOrange,
                        bgColour: kOrange20,
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Feedback.forTap(context);
                          Navigator.pushNamed(context, WaterScreen.id);
                        },
                      ),
                      StatsCard(
                        iconLink: "assets/svg/drug_icon.svg",
                        statsTitle: "Meds",
                        statsValue: medsData.medsList.last.name,
                        statsUnit: "",
                        statsTimestamp: TimeOfDay.fromDateTime(
                                medsData.medsList.last.time.last)
                            .format(context),
                        colour: kPurple,
                        bgColour: kPurple20,
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Feedback.forTap(context);
                          Navigator.pushNamed(context, MedsScreen.id);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding, top: kDefaultPadding2x),
                    child: Text(
                      "Reminders",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),

                  ///Medicine Card
                  const SicklerMedicineCard(
                      daysLeft: "17 days",
                      dose: "2 capsule",
                      medicineName: "Antalgex",
                      time: "8:00 pm"),
                  const SizedBox(height: kDefaultPadding),

                  ///Water Reminder Card
                  const WaterReminderCard(
                      amount: "1 Cup",
                      progress: "1.7",
                      progressPercentage: "64",
                      time: "5:54 PM"),

                  const SizedBox(height: kDefaultPadding2x * 3),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
