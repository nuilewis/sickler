import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sickler/providers/oxygen_provider.dart';

import '../../constants.dart';
import '../../global_components/circular_add_button.dart';
import '../../global_components/custom_route.dart';
import '../../global_components/scaffold_body_with_top_image.dart';
import '../../global_components/sickler_circular_percent_indicator.dart';
import '../waterscreen/components/sickler_bar_charts.dart';
import '../waterscreen/components/week_average.dart';
import 'add_oxygen_screen.dart';

class OxygenScreen extends StatefulWidget {
  static const id = "Oxygen screen";
  const OxygenScreen({ Key? key }) : super(key: key);

  @override
  State<OxygenScreen> createState() => _OxygenScreenState();
}

class _OxygenScreenState extends State<OxygenScreen> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<OxygenData>(
    builder: (context, oxygenData, child){


     // hbData.calcAverageOverTimeRange(endDate: DateTime.now(), numDaysBeforeEndDate: 30);
        return SicklerScaffoldBodyWithTopImage(
        showPageTitle: true,
        pageTitle: "Oxygen",
        topBgColour: kOrange20,
        showBackButton: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    ///Todo: open settings
                  },
                  icon: SvgPicture.asset(
                    "assets/svg/cogwheel_icon.svg",
                    color: kDark60,
                  ),
                ),
              ),
              // Text(
              //   "Your HB increased since your last measurement, keep doing what you are doing 😁😊",
              //   style: Theme.of(context).textTheme.bodyText2,
              // ),
              const SizedBox(height: 40),
    
              ///Water Percentage
               SicklerCircularPercentIndicator(
                progressColour: kGreen,
                progress: 1,
                animate: true,
                value: oxygenData.totalOxygenList.last.value.toString() ,
                unit: "%",
              ),
              const SizedBox(height: 40),
              Text(
               "  ${oxygenData.totalOxygenList.last.time.day.toString().padLeft(2,"0")}-${oxygenData.totalOxygenList.last.time.month.toString().padLeft(2, "0")}-${oxygenData.totalOxygenList.last.time.year}  ${TimeOfDay.fromDateTime(oxygenData.totalOxygenList.last.time).format(context)}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: kDark60),
              ),
              const SizedBox(height: 40),
    
              ///Add Button
              Hero(
                tag: AddOxygenPopup.heroId,
              
                child: SicklerAddButton(
                  colour: kOrange,
                  onPressed: () {
                    Navigator.push(context, HeroDialogRoute(builder: (context)=>  AddOxygenPopup()));
                  },
                ),
              ),
              const SizedBox(height: 60),
    
              ///Hb Stats
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hb Stats",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 20),
                      WeekAverage(
                        title: "This Month's average",
                        iconLink: "assets/svg/o2_icon.svg",
                        unit: "g/dl",
                        amount: oxygenData.averageOxygenOverTimeRange!.toStringAsFixed(1),
                        colour: kOrange,
                        emoji: "😁",
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
    
              ///Statistics Card
              SicklerBarChartStats(
                barColor:kOrange,
                bgColor: kOrange20,
                barValues: [oxygenData.timeRangeList],
                
              ),
    
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      );
    
      }
      );
  }
}