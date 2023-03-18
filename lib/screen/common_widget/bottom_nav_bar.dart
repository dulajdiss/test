// import 'package:ebbf/configs/colors.dart';
// import 'package:ebbf/configs/images.dart';
// import 'package:ebbf/notifire/ebbf_notifire.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class BottomNavBarItems extends StatelessWidget {
//   final ontap;
//   const BottomNavBarItems({super.key, this.ontap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
//       return Theme(
//         data: Theme.of(context).copyWith(
//             primaryColor: Colors.red,
//             indicatorColor: Colors.blue,
//             textTheme: Theme.of(context)
//                 .textTheme
//                 .copyWith(caption: new TextStyle(color: Colors.yellow))),
//         // ignore: unnecessary_new
//         child: new BottomNavigationBar(
//           backgroundColor: AppColors.green,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: showEBBF.selectedIndex,
//           selectedItemColor: AppColors.green,
//           selectedIconTheme: IconThemeData(
//             color: Colors.orange,
//           ),
//           unselectedItemColor: AppColors.white,
//           unselectedLabelStyle: GoogleFonts.roboto(
//               textStyle: const TextStyle(
//             decoration: TextDecoration.none,
//             color: AppColors.white,
//             fontSize: 15,
//           )),
//           selectedLabelStyle: GoogleFonts.roboto(
//               textStyle: const TextStyle(
//             decoration: TextDecoration.none,
//             color: AppColors.black,
//             fontSize: 15,
//           )),
//           items: [
//             BottomNavigationBarItem(
//                 backgroundColor: Colors.white,
//                 icon: const Image(
//                   fit: BoxFit.contain,
//                   // color: Colors.white,
//                   image: AppImages.nav_home,
//                   width: 35,
//                   height: 35,
//                 ),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: const Image(
//                   image: AppImages.nav_gym,
//                   width: 35,
//                   height: 35,
//                 ),
//                 label: 'Gym'),
//             BottomNavigationBarItem(
//                 icon: const Image(
//                   image: AppImages.nav_coach,
//                   width: 35,
//                   height: 35,
//                 ),
//                 label: 'Coach'),
//             BottomNavigationBarItem(
//                 icon: const Image(
//                   image: AppImages.nav_athelatics,
//                   width: 35,
//                   height: 35,
//                 ),
//                 label: 'Athlete'),
//             BottomNavigationBarItem(
//               icon: const Image(
//                 image: AppImages.nav_profile,
//                 width: 35,
//                 height: 35,
//               ),
//               label: 'Profile',
//             ),
//           ],
//           onTap: ontap,
//         ),
//       );
//     });
//   }
// }
