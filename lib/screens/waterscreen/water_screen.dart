import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/scaffold_body_with_top_image.dart';
import 'package:sickler/providers/water_provider.dart';
import '../../global_components/circular_add_button.dart';
import '../../global_components/sickler_circular_percent_indicator.dart';
import 'components/sickler_bar_charts.dart';
import 'components/volume_drunk.dart';
import 'components/water_log_card.dart';
import 'components/week_average.dart';
import 'package:provider/provider.dart';

class WaterScreen extends StatefulWidget {
  static const String id = "water screen";
  const WaterScreen({Key? key}) : super(key: key);

  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WaterData>(builder: (context, waterData, child) {
      return SicklerScaffoldBodyWithTopImage(
        showPageTitle: true,
        pageTitle: "Water",
        topBgColour: kBlue20,
        showBackButton: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                child: Align(
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
              ),
              const SizedBox(
                height: 4,
              ),

              ///Water Percentage
              SicklerCircularPercentIndicator(
                progress: (waterData.percentageCompleted / 100) > 1
                    ? 1
                    : waterData.percentageCompleted / 100,
                animate: true,
                value: waterData.percentageCompleted.toString(),
                unit: "%",
              ),
              const SizedBox(height: 40),
              VolumeDrunk(
                  newVal: waterData.totalWaterDrankToday,
                  volumeDrunk: "${waterData.totalWaterDrankToday} ml",
                  volumeLeft: "${waterData.waterLeftToday}"),
              const SizedBox(height: 40),

              ///Add Button
              SicklerAddButton(
                onPressed: () {
                  // print("adding water");
                  waterData.addWaterLog(context);
                  waterData.calWaterDrankToday();
                  waterData.caclPercentageCompleted();
                  waterData.calcAverageOverTimeRange(
                      endDate: DateTime.now(), numDaysBeforeEndDate: 7);
                },
              ),

              const SizedBox(height: 60),

              ///Water Stats
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Water Stats",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 20),
                      WeekAverage(
                        amount: "${(waterData.averageWaterOverTimeRange/1000).toStringAsFixed(3)} L",
                        //unit: "L",
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ///Statistics Card
              SicklerBarChartStats(
                bgColor: kBlue20,
                barColor: kBlue,
                barValues: [
                  waterData.timeRangeList
                ], //so that the bar chart matches with the average it calculated
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                      top: kDefaultPadding2x,
                      bottom: kDefaultPadding),
                  child: Text(
                    "Today So Far",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),

              ///   /Water log cards
              GridView.builder(
                padding: EdgeInsets.zero,
                
                  physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  itemCount: waterData.totalWaterTodayList.length-1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    mainAxisExtent: 75,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    ///increment the index by 1, beacuse of the initialization method that adds an empty log so the list won't be null
                    ///I should probably fix that, so that we won;t have to basically go through this hack;
                    index++;
                    return WaterLogCard(
                      volume:
                          waterData.totalWaterTodayList[index].value.toString(),
                      time: TimeOfDay.fromDateTime(
                              waterData.totalWaterTodayList[index].time)
                          .format(context),
                    );
                  }),
    
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      );
    });
  }
}
