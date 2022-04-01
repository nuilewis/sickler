import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/appbar.dart';
import 'package:sickler/global_components/sickler_button.dart';
import 'package:sickler/screens/homescreen/components/medicine_card.dart';

import 'add_meds_screen.dart';

class MedsScreen extends StatelessWidget {
  static const id = "your meds screen";
  const MedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SicklerAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kDefaultPadding2x * 4,
              ),
              Text(
                "Your Drugs",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: kDefaultPadding2x,
              ),
              SicklerMedicineCard(
                medicineName: "Antalgex",
                dose: "2 Capsules",
                daysLeft: "17",
                time: "8:00 PM",
                showMenuButton: true,
                menuOnPressed: () {},
              ),
              SicklerMedicineCard(
                medicineName: "Folic Acid",
                dose: "1 tablet",
                daysLeft: "continuous",
                time: "7:00 AM",
                showMenuButton: true,
                menuOnPressed: () {},
              ),
              const SizedBox(
                height: kDefaultPadding2x,
              ),
              SicklerTransparentButton(
                  buttonLabel: "Add Drug",
                  colour: kPurple80,
                  buttonBgColour: kPurple20,
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Feedback.forTap(context);
                    Navigator.pushNamed(context, AddMedsScreen.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
