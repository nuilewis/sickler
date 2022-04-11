import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/constants.dart';



class HBDialogButtons extends StatelessWidget {
  final Color color;
  final String iconLink;
  final VoidCallback onPressed;
  final Color? iconColor;
  const HBDialogButtons(
      {Key? key,
      required this.color,
      required this.onPressed,
      this.iconColor,
      required this.iconLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(kDefaultPadding),
          ),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SvgPicture.asset(
              iconLink,
              color: iconColor ?? Colors.white,
            ),
          ),),
    );
  }
}