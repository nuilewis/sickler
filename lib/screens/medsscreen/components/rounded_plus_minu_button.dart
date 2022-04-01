import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';


class RoundedPlusMinusButton extends StatelessWidget {
  final String iconLink;
  final VoidCallback onPressed;
  const RoundedPlusMinusButton({
    Key? key,
    required this.iconLink,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        Feedback.forTap(context);
        onPressed;
      },
      child: Container(
        height: kDefaultPadding2x + 4,
        width: kDefaultPadding2x + 4,
        decoration: const BoxDecoration(
          color: kPurple,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: SvgPicture.asset(
          iconLink,
          color: Colors.white,
        ),
      ),
    );
  }
}