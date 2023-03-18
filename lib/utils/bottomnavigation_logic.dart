// import 'package:ebbf/screen/athletes/athletes_page.dart';
// import 'package:ebbf/screen/coach/coach_page.dart';
// import 'package:ebbf/screen/gym/gym_page.dart';
// import 'package:ebbf/screen/home/home.dart';
// import 'package:ebbf/screen/profile/dashboard_landing_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ebbf/notifire/ebbf_notifire.dart';
//
// void bottomNavigationLogic(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       {
//         Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(index);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       }
//       break;
//
//     case 1:
//       {
//         Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(index);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const GymPage()),
//         );
//       }
//       break;
//     case 2:
//       {
//         Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(index);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const CoachPage()),
//         );
//       }
//       break;
//     case 3:
//       {
//         Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(index);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const AthletesPage()),
//         );
//       }
//       break;
//     case 4:
//       {
//         Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(index);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileLandingPage()),
//         );
//       }
//       break;
//     default:
//       {
//         Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(index);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       }
//       break;
//   }
// }
