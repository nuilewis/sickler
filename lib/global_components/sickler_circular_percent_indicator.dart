import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constants.dart';


class SicklerCircularPercentIndicator extends StatelessWidget {
  final String value;
  final Color? progressColour;
  final Color? bgColor;
  final bool? animate;
  final String unit;
  final double progress;

  /// Between 0 and 1

  const SicklerCircularPercentIndicator({
    Key? key,
    required this.value,
    this.progressColour,
    this.bgColor,
    this.animate,
    required this.unit,
    required this.progress,

    ///Between 0 and 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * .5,
      height: screenSize.width * .5,
      child: CircularPercentIndicator(
        animateFromLastPercent: true,
        animation: animate ?? false,
        circularStrokeCap: CircularStrokeCap.round,
        radius: screenSize.width * .24,
        progressColor: progressColour ?? kBlue,
        lineWidth: kDefaultPadding,
        backgroundColor: bgColor ?? kBlue20,
        percent: progress,
        center: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 44),
              ),
              TextSpan(
                  text: unit, style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ),
      ),
    );
  }
}

