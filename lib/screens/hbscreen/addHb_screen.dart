import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/providers/hb_provider.dart';
import 'components/hb_dialog_buttons.dart';

class AddHbPopup extends StatelessWidget {
  static const id = "add hb popup";
  static const heroId = "addHbPopup";

  AddHbPopup({Key? key}) : super(key: key);

  final TextEditingController hbAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return 
      Center(
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Hero(
            tag: AddHbPopup.heroId,
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
                          controller: hbAmount,
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: sicklerTextFieldDecoration.copyWith(
                              fillColor: kDark20, hintText: "HB Value")),
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
                                color: kFuchsia20,
                                iconColor: kFuchsia,
                                iconLink: "assets/svg/x_cancel_icon.svg",
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              HBDialogButtons(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  Feedback.forTap(context);
                                  HbData().addHB(double.tryParse(hbAmount.text)!);
                                  Navigator.pop(context);
                      
                                  ///Todo: call add hb method
                                },
                                color: kFuchsia,
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
