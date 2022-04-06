import 'package:flutter/material.dart';
import 'package:sickler/constants.dart';

class SicklerSnackBar extends StatelessWidget{
  final String message;
  final bool success;
  final bool? actions;
 const  SicklerSnackBar(
      {Key? key, required this.message, this.actions, required this.success})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      backgroundColor: success ? kGreen80 : kRed80,
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.white),
      ),
    );
  }
}


void sicklerSnackBar( BuildContext context, {required String message, required bool success}) {

final customSnackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding2x, horizontal: kDefaultPadding),
      padding: const EdgeInsets.symmetric(vertical:kDefaultPadding2x, horizontal: kDefaultPadding),
      backgroundColor: success ? Colors.white : kRed80,
      content: Text(
        message,
        style: success? Theme.of(context)
            .textTheme
            .bodyText2 : Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white)
          ,
      ),
);
ScaffoldMessenger.of(context).showSnackBar(customSnackBar);

}