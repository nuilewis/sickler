import 'package:flutter/material.dart';

///-----------Global Constants------------///

///----Colours----///
const Color kPurple = Color(0xFF531CF7);
const Color kPurple80 = Color(0xFF7B4FFF);
const Color kPurple60 = Color(0xFFB298FF);
const Color kPurple40 = Color(0xFFD3C5FF);
const Color kPurple20 = Color(0xFFEEE9FF);

const Color kFuchsia = Color(0xFFFC4684);
const Color kFuchsia80 = Color(0xFFFF7DA9);
const Color kFuchsia60 = Color(0xFFFFACC8);
const Color kFuchsia40 = Color(0xFFFFD4E3);
const Color kFuchsia20 = Color(0xFFFFE9F0);

const Color kOrange = Color(0xFFFF7448);
const Color kOrange80 = Color(0xFFFF9877);
const Color kOrange60 = Color(0xFFFFCEBE);
const Color kOrange40 = Color(0xFFFFDBCF);
const Color kOrange20 = Color(0xFFFFF0EB);

const Color kRed = Color(0xFFEF233C);
const Color kRed80 = Color(0xFFFA6678);
const Color kRed60 = Color(0xFFFFACB6);
const Color kRed40 = Color(0xFFFFD4D9);
const Color kRed20 = Color(0xFFFFE9EC);

const Color kBlue = Color(0xFF27A8F8);
const Color kBlue80 = Color(0xFF52BDFF);
const Color kBlue60 = Color(0xFF90D5FF);
const Color kBlue40 = Color(0xFFC1E7FF);
const Color kBlue20 = Color(0xFFE1F3FF);

const Color kGreen = Color(0xFF52DBB9);
const Color kGreen80 = Color(0xFF85EBD1);
const Color kGreen60 = Color(0xFFBAF2E4);
const Color kGreen40 = Color(0xFFD0F9EF);
const Color kGreen20 = Color(0xFFE8FDF8);

const Color kDark = Color(0xFF353535);
const Color kDark80 = Color(0xFF4C4C4C);
const Color kDark60 = Color(0xFFBDBDBD);
const Color kDark40 = Color(0xFFD7D7D7);
const Color kDark20 = Color(0xFFF4F4F4);

///----Paddings----///
const double kDefaultPadding = 16.0;
const double kDefaultPadding2x = 32.0;

///----TextStyles----///
const TextStyle kHeading = TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
const TextStyle kHeadingLight =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 28);
const TextStyle kBody = TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
const TextStyle kBodyBold =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
const TextStyle kButtonText =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle kFootNote =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 11);

///----AppBar Style----///

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: Colors.transparent,
  foregroundColor: Colors.transparent,
  elevation: 0,
);


///----------Text Form Field styles ---------////
///

 InputDecoration sicklerTextFieldDecoration = InputDecoration(
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius:  BorderRadius.circular(kDefaultPadding),
        ),
        isDense: false,
        filled: true,
        hintStyle: kBody, 
        fillColor: Colors.white.withOpacity(.2),
      );


////-----------------DateTime constants ---------------
///
 Map<int, String> daysOfWeek ={
1:"Monday",
2: "Tuesday",
3: "Wednesday",
4:"Thursday",
5:"Friday",
6:"Saturday",
7:"Sunday",
 };

  Map<int, String> monthsOfYear ={
1:"January",
2: "February",
3: "March",
4:"April",
5:"May",
6:"June",
7:"July",
8:"August",
9:"September",
10:"October",
11:"November",
12: "December",
 };
   Map<int, String> monthsOfYearShortened ={
1:"Jan",
2: "Feb",
3: "Mar",
4:"Apr",
5:"May",
6:"Jun",
7:"Jul",
8:"Aug",
9:"Sept",
10:"Oct",
11:"Nov",
12: "Dec",
 };