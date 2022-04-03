import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class SicklerBarChartStats extends StatefulWidget {

  final Color bgColor;
  final Color barColor;
  final List barValues;

  const SicklerBarChartStats({
    Key? key, required this.bgColor, required this.barColor, required this.barValues,
  }) : super(key: key);

  @override
  State<SicklerBarChartStats> createState() => _SicklerBarChartStatsState();
}

class _SicklerBarChartStatsState extends State<SicklerBarChartStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
   
      width: double.infinity,
      decoration: BoxDecoration(
          color: kBlue20, 
          borderRadius: BorderRadius.circular(kDefaultPadding + 6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
          BarChartRectangle(completed: true, percentageComplete: 100, completedColor: widget.barColor,),
          const SizedBox(width: 8,),
           BarChartRectangle(completed: false, percentageComplete: 40, completedColor:  widget.barColor,),
        ],
      )
    );
  }
}

class BarChartRectangle extends StatelessWidget {

  final bool completed;
  final Color completedColor;
  final String? volumeDrank;
  final double percentageComplete;

  const BarChartRectangle({
    Key? key, required this.completed, this.volumeDrank, required this.percentageComplete, required this.completedColor
  }) : super(key: key);

double calcBarHeight( double percentageComplete){
///Calculate Bar Heigth from percentage

///Since max height is 140 px, 1% is to 1.4 pixels
///the func has to be flexible for values greater than 100
const scaleRatio  = 1.4;
return scaleRatio * percentageComplete;

}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: 40,
          height: calcBarHeight(percentageComplete),
          decoration: BoxDecoration(
            color: completed ? completedColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: [
              Padding(
                padding:  const EdgeInsets.only(top: 8.0),
                child: Text("1.2", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: completed? Colors.white: kDark80),),
              ),
           Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: completed ? SvgPicture.asset("assets/svg/check_mark_icon.svg", color: Colors.white,) : const SizedBox(),
              ) 
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text("M", style: Theme.of(context).textTheme.bodyText2!.copyWith(color: kDark80)),
      ],
    );
  }
}
