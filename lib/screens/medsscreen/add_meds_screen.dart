import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/scaffold_body_with_top_image.dart';
import 'package:sickler/global_components/sickler_button.dart';

import 'components/rounded_plus_minu_button.dart';

class AddMedsScreen extends StatefulWidget {
  static const id = "add meds screen";
  const AddMedsScreen({Key? key}) : super(key: key);

  @override
  State<AddMedsScreen> createState() => _AddMedsScreenState();
}

class _AddMedsScreenState extends State<AddMedsScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SicklerScaffoldBodyWithTopImage(
      topBgColour: kPurple20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding + 8,
                  bottom: kDefaultPadding),
              child: Text(
                "Add Meds",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding, bottom: kDefaultPadding / 2),
              child: Text(
                "Drug Name",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: kDark60),
              ),
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
              decoration:
                  sicklerTextFieldDecoration.copyWith(fillColor: kPurple20),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding,
                            bottom: kDefaultPadding / 2),
                        child: Text(
                          "mg/pill",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                        decoration: sicklerTextFieldDecoration.copyWith(
                            hintText: "mg", fillColor: kPurple20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: kDefaultPadding,
                          bottom: kDefaultPadding / 2,
                        ),
                        child: Text(
                          "Dosage",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPurple20,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedPlusMinusButton(
                              iconLink: "assets/svg/minus.svg",
                              onPressed: () {},
                            ),
                            Text(
                              "1",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 24),
                            ),
                            RoundedPlusMinusButton(
                              iconLink: "assets/svg/plus_icon.svg",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding,
                  bottom: kDefaultPadding / 2),
              child: Text(
                "Date/Time",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: kDark60),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Probably replace with date picker
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                    decoration: sicklerTextFieldDecoration.copyWith(
                        fillColor: kPurple20, hintText: "dd/mm/yyy"),
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Repeat",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: kDark60),
                      ),
                      const SizedBox(
                        width: kDefaultPadding,
                      ),
                      CupertinoSwitch(
                          activeColor: kPurple80,
                          value: true,
                          onChanged: (bool value) {
                            setState(() {
                              value = !value;
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding,
                            bottom: kDefaultPadding / 2),
                        child: Text(
                          "Duration",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60),
                        ),
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                        keyboardType: TextInputType.number,
                        decoration: sicklerTextFieldDecoration.copyWith(
                            fillColor: Theme.of(context).cardColor,
                            hintText: "Days"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding,
                            bottom: kDefaultPadding / 2),
                        child: Text(
                          "Frequency",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60),
                        ),
                      ),

                      ///Todo: replace with dropdown widget
                      TextFormField(
                        decoration: sicklerTextFieldDecoration.copyWith(
                            fillColor: Theme.of(context).cardColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding,
                            bottom: kDefaultPadding / 2),
                        child: Text(
                          "Time",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kDark60),
                        ),
                      ),

                      ///Replace with time picker
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                        keyboardType: TextInputType.datetime,
                        decoration: sicklerTextFieldDecoration.copyWith(
                            fillColor: Theme.of(context).cardColor,
                            hintText: "8:00 AM"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding2x,
            ),
            SicklerColoredButton(
                buttonLabel: "Save",
                labelColour: Colors.white,
                buttonBgColour: kPurple80,
                onPressed: () {}),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
