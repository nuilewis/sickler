import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/sickler_button.dart';
import 'package:sickler/services/firestore/firestore_service.dart';
import 'package:sickler/size_config.dart';
import '../../global_components/scaffold_body_with_top_image.dart';
import '../homescreen/homescreen.dart';

class HealthSituationScreen extends StatefulWidget {
  static const String id = "health situation screen";
  const HealthSituationScreen({Key? key}) : super(key: key);

  @override
  _HealthSituationScreenState createState() => _HealthSituationScreenState();
}

class _HealthSituationScreenState extends State<HealthSituationScreen> {
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController genotype = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SicklerScaffoldBodyWithTopImage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: relHeight(80, context)),
            Text(
              "Your Health Situation",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "How severe are your crises?",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              "Crises Frequency",
              style: Theme.of(context).textTheme.bodyText1,
            ),

            Text(
              "Average severity",
              style: Theme.of(context).textTheme.bodyText1,
            ),

            ///Next Button
            SicklerColoredButton(
              buttonLabel: "Next",
              buttonBgColour: kPurple80,
              hasShadow: true,
              labelColour: Colors.white,
              onPressed: () {
  HapticFeedback.lightImpact();
        Feedback.forTap(context);
                Navigator.pushNamed(context, SicklerHomeScreen.id);
              },
            ),
            SizedBox(height: relHeight(40, context)),
            
          ],
        ),
      ),
    );
  }
}
