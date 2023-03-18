// ignore_for_file: unrelated_type_equality_checks

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/dashboard_details.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/dashbord/dashboard_profile.dart';
import 'package:ebbf/screen/dashbord/widget/dashboard_detail_table_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardDetailsPage extends StatefulWidget {
  const DashboardDetailsPage({Key? key}) : super(key: key);

  @override
  State<DashboardDetailsPage> createState() => _DashboardDetailsPageState();
}

class _DashboardDetailsPageState extends State<DashboardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      DashBoardDetails dbDetails = showEBBF.dashBoardData;
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              TitalBoxWithBackButton(
                title: 'DASHBOARD',
                direction: "Home > Dashboard > Dashboard Detailed",
                onPress: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(showEBBF.previousSelectedIndex);
                },
              ),
              if (dbDetails.userType.toString() == UserType.UserType_Athlete ||
                  dbDetails.userType.toString() == UserType.UserType_Coach)
                Container(
                    color: AppColors.moreLightGrey,
                    padding: const EdgeInsets.only(
                      top: 10, // Space between underline and text
                    ),
                    child: Center(
                        child: Card(
                      child: SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.93,
                          height: (MediaQuery.of(context).size.height) * 0.64,
                          child: Column(children: [
                            Expanded(
                                flex: 1,
                                child: Stack(children: [
                                  Image.network(
                                    dbDetails.userType.toString() ==
                                            UserType.UserType_Coach
                                        ? dbDetails.coachlogo.toString()
                                        : dbDetails.athletelogo!,
                                    width: (MediaQuery.of(context).size.width) *
                                        0.80,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                      top: (MediaQuery.of(context).size.width) *
                                          0.18,
                                      left:
                                          (MediaQuery.of(context).size.width) *
                                              0.48,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: AppColors.green,
                                            shape: BoxShape.circle),
                                        child: InkWell(
                                            child: const Icon(Icons.edit,
                                                color: AppColors.white),
                                            onTap: () {
                                              Provider.of<EBBFNotifier>(context,
                                                      listen: false)
                                                  .setNavIndex(12);
                                            }),
                                      ))
                                ])),
                            Text(
                              showEBBF.currentUser.fullname.toString(),
                              style: profileUserNameTextstyle(),
                            ),
                            Expanded(
                                flex: 1,
                                child: Image.network(
                                  dbDetails.qrcode!,
                                  width: (MediaQuery.of(context).size.width) *
                                      0.80,
                                  fit: BoxFit.contain,
                                )),
                            Text(
                              'Your Card Details',
                              style: profileUserNameTextstyle(),
                            ),
                            Expanded(
                                flex: 2,
                                child: Stack(children: [
                                  Image.network(
                                    dbDetails.cardBg!,
                                    width: (MediaQuery.of(context).size.width) *
                                        0.80,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                      right:
                                          (MediaQuery.of(context).size.width) *
                                              0.57,
                                      top: (MediaQuery.of(context).size.width) *
                                          0.02,
                                      child: SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.18,
                                        height: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.18,
                                        child: Image.network(
                                          dbDetails.card!,
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.80,
                                          fit: BoxFit.contain,
                                        ),
                                      )),
                                  Positioned(
                                      left:
                                          (MediaQuery.of(context).size.width) *
                                              0.05,
                                      top: (MediaQuery.of(context).size.width) *
                                          0.22,
                                      child: Text(
                                        dbDetails.cardNo!,
                                        style: TextStyle(
                                            fontSize: (MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                                0.05,
                                            color: AppColors.white),
                                      )),
                                  Positioned(
                                      left:
                                          (MediaQuery.of(context).size.width) *
                                              0.50,
                                      top: (MediaQuery.of(context).size.width) *
                                          0.29,
                                      child: Text(
                                        dbDetails.membershipValid!,
                                        style: TextStyle(
                                            fontSize: (MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                                0.05,
                                            color: AppColors.white),
                                      )),
                                  Positioned(
                                      left:
                                          (MediaQuery.of(context).size.width) *
                                              0.05,
                                      top: (MediaQuery.of(context).size.width) *
                                          0.34,
                                      child: Text(
                                        dbDetails.athleteTitle!,
                                        style: TextStyle(
                                            fontSize: (MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                                0.05,
                                            color: AppColors.white),
                                      )),
                                  Positioned(
                                      left:
                                          (MediaQuery.of(context).size.width) *
                                              0.05,
                                      top: (MediaQuery.of(context).size.width) *
                                          0.41,
                                      child: Text(
                                        dbDetails.userType.toString() ==
                                                UserType.UserType_Athlete
                                            ? "Athlete"
                                            : "Coach",
                                        style: TextStyle(
                                            fontSize: (MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                                0.04,
                                            color: AppColors.white),
                                      )),
                                ])),
                          ])),
                    ))),

              if (dbDetails.userType.toString() == UserType.UserType_Gym_Owner)
                Container(
                    color: AppColors.moreLightGrey,
                    padding: const EdgeInsets.only(
                      top: 10, // Space between underline and text
                    ),
                    child: Center(
                        child: Card(
                      child: SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.93,
                          height: (MediaQuery.of(context).size.height) * 0.64,
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: Stack(children: [
                                  SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.35,
                                      height:
                                          (MediaQuery.of(context).size.width) *
                                              0.35,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(dbDetails.gymlogo!),
                                      )),
                                  // Positioned(
                                  //     top: (MediaQuery.of(context).size.width) *
                                  //         0.2,
                                  //     left:
                                  //         (MediaQuery.of(context).size.width) *
                                  //             0.26,
                                  //     child: Container(
                                  //       width: 30,
                                  //       height: 30,
                                  //       decoration: const BoxDecoration(
                                  //           color: AppColors.green,
                                  //           shape: BoxShape.circle),
                                  //       child: InkWell(
                                  //           child: const Icon(Icons.edit,
                                  //               color: AppColors.white),
                                  //           onTap: () {
                                  //             Provider.of<EBBFNotifier>(context,
                                  //                     listen: false)
                                  //                 .setNavIndex(26);
                                  //           }),
                                  //     ))
                                ])),
                            Text(
                              showEBBF.currentUser.fullname.toString(),
                              style: profileUserNameTextstyle(),
                            ),
                            Expanded(
                                flex: 2,
                                child: SizedBox(
                                    width: (MediaQuery.of(context).size.width) *
                                        0.85,
                                    child: DashBoardDetailsTableRow(
                                        dbDetails: dbDetails)))
                          ])),
                    ))),
              if (dbDetails.userType.toString() == UserType.UserType_Organized)
                Container(
                    color: AppColors.moreLightGrey,
                    padding: const EdgeInsets.only(
                      top: 10, // Space between underline and text
                    ),
                    child: Center(
                        child: Card(
                      child: SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.93,
                          height: (MediaQuery.of(context).size.height) * 0.64,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Stack(children: [
                                  SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.35,
                                      height:
                                          (MediaQuery.of(context).size.width) *
                                              0.35,
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/Dashboarddetailimage.png"),
                                      )),
                                  // Positioned(
                                  //     top: (MediaQuery.of(context).size.width) *
                                  //         0.2,
                                  //     left:
                                  //         (MediaQuery.of(context).size.width) *
                                  //             0.26,
                                  //     child: Container(
                                  //       width: 30,
                                  //       height: 30,
                                  //       decoration: const BoxDecoration(
                                  //           color: AppColors.green,
                                  //           shape: BoxShape.circle),
                                  //       child: InkWell(
                                  //           child: const Icon(Icons.edit,
                                  //               color: AppColors.white),
                                  //           onTap: () {
                                  //             Provider.of<EBBFNotifier>(context,
                                  //                     listen: false)
                                  //                 .setNavIndex(26);
                                  //           }),
                                  //     ))
                                ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Welcome ${showEBBF.currentUser.fullname}",
                                  style: profileUserNameTextstyle(),
                                ),
                              ])),
                    )))
            ])),
      );
    });
  }
}
