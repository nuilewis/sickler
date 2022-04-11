import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/providers/oxygen_provider.dart';

import '../hbscreen/components/hb_dialog_buttons.dart';


class AddOxygenPopup extends StatelessWidget {
  static const id = "add oxygen popup";
  static const heroId = "add_oxygen_popup_heroId";
  AddOxygenPopup({ Key? key }) : super(key: key);

  final TextEditingController oxygenAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return      Center(
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Hero(
            tag: AddOxygenPopup.heroId,
            child: Material(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultPadding2x)
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add Heamoglobin",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                          controller: oxygenAmount,
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: sicklerTextFieldDecoration.copyWith(
                              fillColor: kDark20, hintText: "Oxygen Value")),
                      const SizedBox(
                        height: kDefaultPadding2x,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                           
                            children: [
                              HBDialogButtons(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  Feedback.forTap(context);
                      
                                  Navigator.pop(context);
                                },
                                color: kOrange20,
                                iconColor: kOrange,
                                iconLink: "assets/svg/x_cancel_icon.svg",
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              HBDialogButtons(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  Feedback.forTap(context);
                                  OxygenData().addOxygen(double.tryParse(oxygenAmount.text)!);
                                  Navigator.pop(context);
                      
                                  ///Todo: call add hb method
                                },
                                color: kOrange,
                                iconLink: "assets/svg/check_mark_icon.svg",
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    
 
  }
}