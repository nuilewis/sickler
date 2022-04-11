import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/global_components/appbar.dart';
import 'package:sickler/global_components/sickler_button.dart';
import 'package:sickler/providers/meds_provider.dart';
import 'package:sickler/screens/homescreen/components/medicine_card.dart';

import '../../models/meds_model.dart';
import 'add_meds_screen.dart';

class MedsScreen extends StatefulWidget {
  static const id = "your meds screen";
  const MedsScreen({Key? key}) : super(key: key);

  @override
  State<MedsScreen> createState() => _MedsScreenState();
}

class _MedsScreenState extends State<MedsScreen> {
  Widget buildMedsList({required List<MedsLog> medsList, required int index}){
    return      SicklerMedicineCard(
                   medicineName: medsList[index].name,
                   dose: "${medsList[index].dose} ${medsList[index].medsType ?? "Pills"}(s)",
                   daysLeft: "${medsList[index].daysLeft} day(s)",
                   time: TimeOfDay.fromDateTime(medsList[index].time.last).format(context),
                  showMenuButton: true,
                  menuOnPressed: () {
                    ///Todo: navigate to edit meds menu
                  },
               );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MedsData>(
      builder: (context, medsData, child ){
        return  Scaffold(
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
                  "Your Meds",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: kDefaultPadding2x,
                ),
            
                // SicklerMedicineCard(
                //   medicineName: "Folic Acid",
                //   dose: "1 tablet",
                //   daysLeft: "continuous",
                //   time: "7:00 AM",
                //   showMenuButton: true,
                //   menuOnPressed: () {},
                // ),
    
                ListView.builder(
                  itemCount: medsData.medsList.length,
                  itemBuilder: (context, index){
                  
                  return buildMedsList(
    index: index,
    medsList: medsData.medsList, 
                  );
                }),
                const SizedBox(
                  height: kDefaultPadding2x,
                ),
                SicklerTransparentButton(
                    buttonLabel: "Add Meds",
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
  
      },
    );
  }
}
