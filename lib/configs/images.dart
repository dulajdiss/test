// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

const String imagePath = 'assets/images';
const String iconPath = 'assets/bottom_nav_icon';

class OwnImage extends AssetImage {
  const OwnImage(String fileName) : super('$imagePath/$fileName');
}

class BottomIcon extends AssetImage {
  const BottomIcon(String fileName) : super('$iconPath/$fileName');
}

class AppImages {
  static const logo = OwnImage('logo.png');
  static const qrcode = OwnImage('qr_code.png');
  static const visacard = OwnImage('visa_card.png');
  static const logo1 = OwnImage('Logo1.png');
  static const logo2 = OwnImage('Logo2.png');
  static const splackscreenimage = OwnImage('splackscreenimage.png');
  static const about1 = OwnImage('aboutimage1.jpg');
  static const about2 = OwnImage('aboutimage2.jpg');
  static const homescreenimage = OwnImage('Homescreenimage.png');
  static const homescreenimagebanner = OwnImage('Homescreenimagebanner.jpg');
  static const director1 = OwnImage('boardofdirectorsimage1.jpg');
  static const director2 = OwnImage('boardofdirectorsimage2.jpg');
  static const director3 = OwnImage('boardofdirectorsimage3.jpeg');
  static const director4 = OwnImage('boardofdirectorsimage4.jpeg');
  static const director5 = OwnImage('boardofdirectorsimage5.jpeg');
  static const coatchListingimage = OwnImage('coatchListingimage.jpg');
  static const coachdetailsimage = OwnImage('coachdetailsimage.jpg');
  static const gymdetailimage = OwnImage('gymdetailimage.jpg');
  static const gymlistingsccreenimage = OwnImage('Gymlistingsccreenimage.jpg');
  static const dashboarddetailimage = OwnImage('Dashboarddetailimage.png');
  static const dashboardachivementimage =
      OwnImage('Dashboardachivementimage.png');
  //dashboard athletic
  static const dashboard = OwnImage('dashboard.png');
  static const profile = OwnImage('profile.png');
  static const events = OwnImage('event.png');
  static const achievement = OwnImage('achievement.png');
  static const sportAssociated = OwnImage('sport_associated.png');
  static const membership = OwnImage('membership.png');
  static const changePassword = OwnImage('change_password.png');
  static const logout = OwnImage('logout.png');
  static const aboutHipent = OwnImage('aboutHipent.png');
  static const otpPin = OwnImage('otp_pin.png');
  //dashboard gym
  static const noc = OwnImage('noc.png');
  static const coachapprovals = OwnImage('coach_approvals.png');
  static const issueRenew = OwnImage('membership.png');
  static const activities = OwnImage('activities.png');
  //dashboard course
  static const coachCourses = OwnImage('event.png');
  //dashboard organized
  static const organizerAthleticApplication =
      OwnImage('athletic.png');
  //end drower
  static const enddrowerclose = OwnImage('close.png');
  static const videothumbnel = OwnImage('video_thumbnel.png');
  //bottom nav bar
  static const nav_home = BottomIcon('home.png');
  static const nav_coach = BottomIcon('coach.png');
  static const nav_gym = BottomIcon('gym.png');
  static const nav_athelatics = BottomIcon('athelatics.png');
  static const nav_profile = BottomIcon('profile.png');
  //contact us icons
  static const contact_call_us = OwnImage('call-us-icon.png');
  static const contact_email = OwnImage('email-icon.png');
  static const contact_location = OwnImage('location-icon.png');
  static const contact_opening_hours = OwnImage('opening-hours-icon.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(qrcode, context);
    await precacheImage(logo, context);
    await precacheImage(visacard, context);
    await precacheImage(logo1, context);
    await precacheImage(logo2, context);
    await precacheImage(splackscreenimage, context);
    await precacheImage(about1, context);
    await precacheImage(about2, context);
    await precacheImage(homescreenimage, context);
    await precacheImage(homescreenimagebanner, context);
    await precacheImage(director1, context);
    await precacheImage(director2, context);
    await precacheImage(director3, context);
    await precacheImage(director4, context);
    await precacheImage(director5, context);
    await precacheImage(coatchListingimage, context);
    await precacheImage(coachdetailsimage, context);
    await precacheImage(gymdetailimage, context);
    await precacheImage(gymlistingsccreenimage, context);
    await precacheImage(dashboarddetailimage, context);
    await precacheImage(dashboardachivementimage, context);
    //dashboard
    await precacheImage(dashboard, context);
    await precacheImage(profile, context);
    await precacheImage(events, context);
    await precacheImage(achievement, context);
    await precacheImage(sportAssociated, context);
    await precacheImage(membership, context);
    await precacheImage(changePassword, context);
    await precacheImage(logout, context);
    await precacheImage(aboutHipent, context);
    await precacheImage(otpPin, context);
    await precacheImage(coachCourses, context);
    //drower
    await precacheImage(enddrowerclose, context);
    await precacheImage(videothumbnel, context);
    //nav bar
    await precacheImage(nav_home, context);
    await precacheImage(nav_gym, context);
    await precacheImage(nav_coach, context);
    await precacheImage(nav_athelatics, context);
    await precacheImage(nav_profile, context);
    //contact us
    await precacheImage(contact_call_us, context);
    await precacheImage(contact_email, context);
    await precacheImage(contact_location, context);
    await precacheImage(contact_opening_hours, context);
  }
}
