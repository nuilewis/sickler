import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/global_components/sickler_button.dart';
import 'package:sickler/screens/authscreens/components/text_form_field.dart';
import 'package:sickler/screens/authscreens/sign_in_screen.dart';
import 'package:sickler/services/firebase_auth/firebase_auth_service.dart';
import '../../constants.dart';


class CreateAccountScreen extends StatefulWidget {
  static const String id = "create account screen";
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  List<bool> isDoingWork = [false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kPurple80,
      //resizeToAvoidBottomInset: false,
      // appBar: SicklerAppBar(
      //    showActions: false,
      //    leading: Padding(
      //      padding: const EdgeInsets.only(
      //          left: kDefaultPadding2x, top: kDefaultPadding2x),
      //      child:
      //          SvgPicture.asset("assets/svg/back_icon.svg", color: Colors.white),
      //    ),
      //  ),
      body: Stack(
        children: [
          SizedBox(
            height: screenSize.height,
          ),
          Positioned(
            left: 0,
            top: 0,
            child: SvgPicture.asset("assets/svg/orange_blob.svg",
                width: screenSize.width * .7),
          ),
          Positioned(
            right: 0,
            top: screenSize.height -
                500, //568 is the  actual height of the pink blob,
            child: SvgPicture.asset("assets/svg/pink_blob.svg",
                width: screenSize.width),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50, 
                  ),
                  IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      "assets/svg/back_icon.svg",
                      color: Colors.white,
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Feedback.forTap(context);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Welcome,",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    "Create an Account",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: firstName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                    decoration: sicklerTextFieldDecoration.copyWith(
                      hintText: "First Name",
                      fillColor: Colors.white.withOpacity(.2),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    controller: lastName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                    decoration: sicklerTextFieldDecoration.copyWith(
                      hintText: "Last Name",
                      fillColor: Colors.white.withOpacity(.2),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding, ),
                  TextFormField(
                    controller: email,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                    decoration: sicklerTextFieldDecoration.copyWith(
                      hintText: "Email",
                      fillColor: Colors.white.withOpacity(.2),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding, ),
                  SicklerPasswordField(
                      controller: password, hintText: "Password"),
                  const SizedBox(
                    height: 60,
                  ),
                  SicklerButton(
                    isDoingWork:  isDoingWork[0],
                      colour: kPurple80,
                      buttonLabel: "Create Account",
                      onPressed: () async {
                          setState(() {
                              isDoingWork[0] = true;
                            });
                        HapticFeedback.lightImpact();
                        Feedback.forTap(context);
                        FirebaseAuthService()
                            .registerUser(context, email: email.text, password: password.text, firstName: firstName.text, lastName: lastName.text);
                            

                          

                        ///Todo: probably makr somthing to show that the app is registering
                      },
                      isPrimaryButton: true),

                  const SizedBox(
                    height: kDefaultPadding,
                  ),

                  ///Todo: Change to google logo
                  SicklerButton(
                    isDoingWork: isDoingWork[1],
                      colour: kPurple80,
                      buttonLabel: "Sign In with Google",
                      onPressed: () async {
                          setState(() {
                              isDoingWork[1] = true;
                            });
                        HapticFeedback.lightImpact();
                        Feedback.forTap(context);
                        FirebaseAuthService().signInWithGoogle(context);

                        ///Todo: probably makr somthing to show that the app is registering
                      },
                      isPrimaryButton: true),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Feedback.forTap(context);
                      Navigator.popAndPushNamed(context, SicklerSignInScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Center(
                        child: Text(
                          "Sign In Instead",
                          style: kFootNote.copyWith(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
