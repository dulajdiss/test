import 'package:ebbf/configs/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:google_fonts/google_fonts.dart';

//Splash Page Style//
TextStyle splashTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.splashLinerProgress,
    fontSize: 30,
  ));
}

//Home Screen
//#news
TextStyle newsTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: AppFontSizes.main_headings,
  ));
}

//# View All
TextStyle viewAllTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: AppFontSizes.sub_headings,
  ));
}

//# View All
TextStyle newsTopicTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: AppFontSizes.main_headings,
  ));
}

TextStyle eventDiscriptionopicTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: AppFontSizes.main_headings,
  ));
}

TextStyle newsBodyTextstyle() {
  // ignore: prefer_const_constructors
  return const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: AppFontSizes.sub_headings,
  );
}

//# DD/MM/YYYY
TextStyle ddmmyyyyTextstyle(BuildContext context) {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      decoration: TextDecoration.none,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: (MediaQuery.of(context).size.width) * 0.04,
    ),
  );
}

TextStyle ddMonthyyyyTextstyle(BuildContext context) {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: (MediaQuery.of(context).size.width) * 0.04,
  ));
}

// Title Box Style
TextStyle titleBoxTitleTextStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: AppFontSizes.main_headings,
  ));
}

TextStyle titleBoxDiscriptionTextStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 15,
  ));
}

// About EBBF
TextStyle aboutTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 25,
  ));
}

//# EBBF
TextStyle aboutEBBFTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 15,
  ));
}

//About Details Box Topic
TextStyle aboutDetailsBoxTopicTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 50,
  ));
}

//About Details Box description
TextStyle aboutDetailsBoxDescriptionTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 15,
  ));
}

//InfoBox title
TextStyle infoBoxTitleTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 30,
  ));
}

//
//# View All
TextStyle infoBoxTopicTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 25,
  ));
}

//Vision Mission Sport
// ignore: non_constant_identifier_names
TextStyle visionMissionSportTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.black,
          // fontWeight: FontWeight.bold,
          fontSize: 45));
}
TextStyle addSportAssoSelectList() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.black,
          // fontWeight: FontWeight.bold,
          fontSize: 15));
}


//Director Board
// ignore: non_constant_identifier_names
TextStyle directorNameTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.white,
    // fontWeight: FontWeight.bold,
    fontSize: 20,
  ));
}

TextStyle bodTitleTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.black,
          // fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.main_headings));
}

// ignore: non_constant_identifier_names
TextStyle directorPositionTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 15,
  ));
}

//President MSG Sport
// ignore: non_constant_identifier_names
TextStyle presidentMSGTitleTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.black,
          // fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.main_headings));
}

// ignore: non_constant_identifier_names
TextStyle presidentMsgBoadyTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: AppFontSizes.paragraph,
  ));
}

// ignore: non_constant_identifier_names
TextStyle dropdownTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.green,
    fontSize: 15,
  ));
}

//EVENTS PAGE
// ignore: non_constant_identifier_names
TextStyle eventPageTopicTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: AppFontSizes.main_headings,
  ));
}

// ignore: non_constant_identifier_names
TextStyle eventPageDescriptionTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 25,
  ));
}

// Coatch Details
// ignore: non_constant_identifier_names
TextStyle coatchDetailsTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 20,
  ));
}

TextStyle coatchDetailsPersonalTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 40,
  ));
}

//News Details

TextStyle newsDetailsTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 35,
  ));
}

TextStyle newsDetailsBodyTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 25,
  ));
}

//Countact Us Page
TextStyle countactUsGridTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 25,
  ));
}

TextStyle countactUsGridSubTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 14,
  ));
}
//Login Details

TextStyle loginTitleTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 45,
  ));
}

TextStyle loginDescriptionTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 18,
  ));
}

TextStyle loginDescriptionLinkTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.blue,
    fontSize: 18,
  ));
}

//Dashboard Details
TextStyle profileUserNameTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 25,
  ));
}

//Dashboard Profile Details
TextStyle profileIntroductionTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 20,
  ));
}

//End Drower

TextStyle endDrowerTextStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 20,
  ));
}

TextStyle endDrowerAboutSubTextStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 15,
  ));
}
//Home Video On Messages

TextStyle onVideoMSGTextStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.white,
    fontSize: AppFontSizes.main_headings,
  ));
}

TextStyle onVideoMSGBodyTextStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.white,
    fontSize: AppFontSizes.paragraph,
  ));
}

//Gym Style
TextStyle gymDetailsTopicTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.anton(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 40,
  ));
}

TextStyle gymDetailsDescriptionTextstyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 20,
  ));
}

//OTP Page
TextStyle otpDescription() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 20,
  ));
}

TextStyle otpErrorDescription() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.red,
    fontSize: 20,
  ));
}

//dashboard achievements
TextStyle dashBoardAchievement() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  ));
}

TextStyle dashBoardAchievementContain() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    decoration: TextDecoration.none,
    fontSize: 15,
  ));
}

//dashboard achievements
TextStyle courseCardStyle() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: AppColors.white,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  ));
}

TextStyle courseCardStyleGrey() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: AppColors.grey,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  ));
}

TextStyle courseCardStyleGreen() {
  // ignore: prefer_const_constructors
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: AppColors.green,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  ));
}

TextStyle courseCardStyleExam() {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: AppColors.white,
    decoration: TextDecoration.none,
    fontSize: 15,
  ));
}

TextStyle courseCardStyleExamGrey() {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: AppColors.grey,
    decoration: TextDecoration.none,
    fontSize: 15,
  ));
}

TextStyle coursesPreliminary(double fontSize) {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
    color: AppColors.green,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
  ));
}

TextStyle coursesSubText(double fontSize) {
  return TextStyle(
    color: AppColors.black,
    decoration: TextDecoration.none,
    // fontWeight: FontWeight.bold,
    fontSize: fontSize,
  );
}
