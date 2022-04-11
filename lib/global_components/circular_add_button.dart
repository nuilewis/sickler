
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/constants.dart';


class SicklerAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? iconLink;
  final Color? colour;

  const SicklerAddButton({
    Key? key,
    required this.onPressed,
    this.iconLink,
    this.colour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:  Colors.transparent,
      elevation: 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).cardColor,
          elevation: 0,
          enableFeedback: true,
          minimumSize: const Size.square(72),
          maximumSize: const Size.square(72),
          shape: const CircleBorder(side: BorderSide.none),
        ),
        onPressed:
          onPressed,
      
          
      
        child: SvgPicture.asset(
          
          iconLink ?? "assets/svg/plus_icon.svg",
          color: colour ?? kBlue,
        ),
      ),
    );
  }
}
