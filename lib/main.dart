import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sickler/Theme.dart';
import 'package:sickler/providers/user_provider.dart';
import 'package:sickler/providers/water_provider.dart';
import 'package:sickler/screens/addscreen/add_screen.dart';
import 'package:sickler/screens/authscreens/create_account_screen.dart';
import 'package:sickler/screens/authscreens/root_screen.dart';
import 'package:sickler/screens/authscreens/sign_in_screen.dart';
import 'package:sickler/screens/drugsscreen/add_drugs_screen.dart';
import 'package:sickler/screens/drugsscreen/meds_screen.dart';
import 'package:sickler/screens/emergencyscreen/emergency_contact.dart';
import 'package:sickler/screens/hbscreen/hb_screen.dart';
import 'package:sickler/screens/homescreen/homescreen.dart';
import 'package:sickler/screens/info_gathering_screens/health_situation_screen.dart';
import 'package:sickler/screens/info_gathering_screens/personal_info_gathering_screen.dart';
import 'package:sickler/screens/waterscreen/water_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const Sickler());
}

class Sickler extends StatelessWidget {
  const Sickler({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SUserData>(create: (context) => SUserData()),
        ChangeNotifierProvider<WaterData>(create: (context) => WaterData()),
      ],
      child: Builder(
        builder: ((context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sickler',
            theme: sicklerLightTheme(context),
            home: const RootScreen(),
            routes: {
              SicklerHomeScreen.id: (context) => const SicklerHomeScreen(),
              SicklerSignInScreen.id: (context) => const SicklerSignInScreen(),
              CreateAccountScreen.id: (context) => const CreateAccountScreen(),
              PersonalInfoGatheringScreen.id: (context) =>
                  const PersonalInfoGatheringScreen(),
              HealthSituationScreen.id: (context) =>
                  const HealthSituationScreen(),
              WaterScreen.id: (context) => const WaterScreen(),
              HbScreen.id: (context) => const HbScreen(),
              AddScreen.id: (context) => const AddScreen(),
              AddMedsScreen.id: (context) => const AddMedsScreen(),
              MedsScreen.id: (context) => const MedsScreen(),
              EmergencyContactsScreen.id: (context) =>
                  const EmergencyContactsScreen(),
            },
          );
        }),
      ),
    );
  }
}
