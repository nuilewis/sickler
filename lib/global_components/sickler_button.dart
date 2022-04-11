import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';


class SicklerButton extends StatelessWidget {
  final String buttonLabel;
  final bool isDoingWork;
  final Color colour;
  final bool isPrimaryButton;
  final VoidCallback onPressed;
  const SicklerButton(
      {Key? key,
      required this.buttonLabel,
      required this.colour,
      required this.onPressed,
      required this.isPrimaryButton,
      required this.isDoingWork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: isPrimaryButton
                ? [
                    BoxShadow(
                        color: colour.withOpacity(.3),
                        offset: const Offset(0, 7),
                        blurRadius: 15)
                  ]
                : null,
            color: isPrimaryButton ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(kDefaultPadding + 4),
            border: isPrimaryButton
                ? null
                : Border.all(width: 1.5, color: Colors.white)),
        child: Center(
          child: isDoingWork
              ? const Padding(
              padding:  EdgeInsets.all(kDefaultPadding / 2),
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(kPurple80),
              ),
                )
              : Text(
                  buttonLabel,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                      fontWeight:
                          isPrimaryButton ? FontWeight.bold : FontWeight.normal,
                      color: isPrimaryButton ? colour : Colors.white),
                ),
        ),
      ),
    );
  }
}

class SicklerColoredButton extends StatelessWidget {
  final bool? isDoingWork;
  final bool? hasShadow;
  final String buttonLabel;
  final Color? labelColour;
  final Color buttonBgColour;
  final VoidCallback onPressed;
  const SicklerColoredButton({
    Key? key,
    required this.buttonLabel,
    this.labelColour,
    required this.buttonBgColour,
    required this.onPressed,
    this.isDoingWork = false,
    this.hasShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: hasShadow!
              ? [
                  BoxShadow(
                      color: buttonBgColour.withOpacity(.3),
                      offset: const Offset(0, 7),
                      blurRadius: 15)
                ]
              : null,
          color: buttonBgColour,
          borderRadius: BorderRadius.circular(kDefaultPadding + 4),
        ),
        child: Center(
          child: isDoingWork!
              ? const Padding(
              padding:  EdgeInsets.all(kDefaultPadding / 2),
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
                )
              :  Text(
            buttonLabel,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: labelColour ??
                    Theme.of(context).textTheme.bodyText1!.color),
          ),
        ),
      ),
    );
  }
}

class SicklerTransparentButton extends StatelessWidget {
  final String buttonLabel;
  final Color? colour;
  final Color buttonBgColour;
  final VoidCallback onPressed;
  const SicklerTransparentButton({
    Key? key,
    required this.buttonLabel,
    required this.colour,
    required this.buttonBgColour,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonBgColour,
          borderRadius: BorderRadius.circular(kDefaultPadding + 4),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonLabel,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 18,
                      color: colour,
                    ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              SvgPicture.asset(
                "assets/svg/plus_icon.svg",
                color: colour,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
