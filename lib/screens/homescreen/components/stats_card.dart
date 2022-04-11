import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class StatsCard extends StatelessWidget {
  final String iconLink;
  final String statsTitle;
  final String statsValue;
  final String statsUnit;
  
  final Color bgColour;
  final Color colour;
  final VoidCallback? onPressed;

  ///Todo: Change from String to Timestamp variable
  final String? statsTimestamp;

  const StatsCard({
    Key? key,
    required this.iconLink,
    required this.statsTitle,
    required this.statsValue,
    required this.statsUnit,
    required this.colour,
    required this.bgColour,
    this.onPressed,
     this.statsTimestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: (screenSize.width - (3 * kDefaultPadding)) * .5,
        height: relHeight(110, context),
        // height: 100,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * .5),
        decoration: BoxDecoration(
          color: bgColour,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                statsTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: colour),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                iconLink,
                color: colour,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: statsValue.toString(),
                            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24)),
                        TextSpan(
                            text: statsUnit,
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 7,
              child: Text(
                statsTimestamp ?? "N/A",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: colour, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
