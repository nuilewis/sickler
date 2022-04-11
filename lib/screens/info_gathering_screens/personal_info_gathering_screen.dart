import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/sickler_button.dart';
import 'package:sickler/services/firestore/firestore_service.dart';
import 'package:sickler/size_config.dart';
import '../../providers/user_provider.dart';
import 'components/personal_info_gathering_list_item.dart';
import 'health_situation_screen.dart';

class PersonalInfoGatheringScreen extends StatefulWidget {
  static const String id = "personal info gathering screen";
  const PersonalInfoGatheringScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoGatheringScreenState createState() =>
      _PersonalInfoGatheringScreenState();
}

class _PersonalInfoGatheringScreenState
    extends State<PersonalInfoGatheringScreen> {
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController genotype = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<SUserData>(builder: (context, userData, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: relHeight(80, context)),
                Text(
                  "We'd like to know you",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "Tell us about yourself",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: relHeight(50, context),
                ),
                PersonalInfoListItem(
                    title: "Your Gender",
                    controller: gender,
                    iconLink: "assets/svg/user_icon.svg",
                    iconColour: kPurple80,
                    iconBgColour: kPurple20),
                PersonalInfoListItem(
                    isNumField: true,
                    title: "Your Age",
                    controller: age,
                    iconLink: "assets/svg/cake_icon.svg",
                    iconColour: kOrange,
                    iconBgColour: kOrange20),
                PersonalInfoListItem(
                    unit: "cm",
                    isNumField: true,
                    title: "Your Height",
                    controller: height,
                    iconLink: "assets/svg/ruler_icon.svg",
                    iconColour: kGreen,
                    iconBgColour: kGreen20),
                PersonalInfoListItem(
                    unit: "Kg",
                    isNumField: true,
                    title: "Your Weight",
                    controller: weight,
                    iconLink: "assets/svg/weight_icon.svg",
                    iconColour: kFuchsia,
                    iconBgColour: kFuchsia20),
                PersonalInfoListItem(
                    title: "Your Genotype",
                    controller: genotype,
                    iconLink: "assets/svg/dna_icon.svg",
                    iconColour: kBlue,
                    iconBgColour: kBlue20),
                SizedBox(height: relHeight(30, context)),
                SicklerColoredButton(
                  buttonLabel: "Next",
                  buttonBgColour: kPurple80,
                  hasShadow: true,
                  labelColour: Colors.white,
                  onPressed: () async {
                    HapticFeedback.lightImpact();
                    Feedback.forTap(context);
                   await FirestoreService(uid: userData.user.uid!)
                        .addUserProfileInfo(
                            firstName: userData.user.firstName!,
                            lastName: userData.user.lastName,
                            context: context);
                            
                    await FirestoreService(uid: userData.user.uid!).addUserHealthInfo(
                      context,
                      height: double.tryParse(height.text),
                      age: int.tryParse(age.text),
                      weight: double.tryParse(weight.text),
                      gender: gender.text,
                      genotype: genotype.text.toUpperCase(),
                    );
                    Navigator.pushNamed(context, HealthSituationScreen.id);
                  },
                ),
                SizedBox(height: relHeight(40, context)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
