import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../global_components/checkbox.dart';
import '../../../size_config.dart';

class SicklerMedicineCard extends StatelessWidget {
  final Color? colour;
  final String medicineName;
  final String time;
  final String dose;
  final String daysLeft;
  final bool? showMenuButton;
  final VoidCallback? menuOnPressed;

  const SicklerMedicineCard({
    Key? key,
    required this.medicineName,
    required this.dose,
    required this.daysLeft,
    required this.time,
    this.showMenuButton = false,
    this.menuOnPressed,
    this.colour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Todo: make checkbox work
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding/2, bottom: kDefaultPadding/2),
      width: double.infinity,
      height: relHeight(150, context),
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding/2,
         
          bottom: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: kDefaultPadding,
            child: SvgPicture.asset(
              "assets/svg/drug_icon.svg",
              color: colour ?? kPurple,
            ),
          ),
          Positioned(
            top: kDefaultPadding,
            left: kDefaultPadding2x,
            child: Text(
              medicineName,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
          ),
         showMenuButton! ? Positioned(
            right: 0,
            top: 0,
            child: 
            GestureDetector(
                  onTap: () {
                Feedback.forTap(context);
                HapticFeedback.lightImpact();
                menuOnPressed;
              },
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SvgPicture.asset(
                    "assets/svg/horizontal_menu_dot_icon.svg",
                    color: kDark60,
                  
                ),
              ),
            ),
          ) : const SizedBox(),
          Positioned(
            top: kDefaultPadding*3,
            left: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Time: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60, fontSize: 12)),
                      TextSpan(
                          text: time,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Dose: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60, fontSize: 12)),
                      TextSpan(
                          text: dose,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Days left: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60, fontSize: 12)),
                      TextSpan(
                          text: daysLeft,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 4,
            bottom: 0,
            child: SicklerCheckbox(
              colour: colour ?? kPurple,
            ),
          ),
        ],
      ),
    );
  }
}
