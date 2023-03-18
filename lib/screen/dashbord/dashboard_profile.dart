// ignore_for_file: use_build_context_synchronously

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/dashboard_details.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/web_view_page.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProfile extends StatefulWidget {
  const DashboardProfile({Key? key}) : super(key: key);

  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

class _DashboardProfileState extends State<DashboardProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      UserModel user = showEBBF.currentUser;
      ProfileDetailsModel profDetails = showEBBF.profileDetails;
      int establishYear = 0;
      if (profDetails.userType.toString() == '1') {
        establishYear = int.parse(DateTime.now().year.toString()) -
            int.parse(showEBBF.dashBoardData.established!);
      }
      return Scaffold(
          body:  SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              TitalBoxWithBackButton(
                title: 'DASHBOARD',
                direction: "Home > Dashboard > Profile",
                onPress: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(4);
                },
              ),

              Center(
                  child: SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.93,
                      height: (MediaQuery.of(context).size.height) * 0.24,
                      child: Column(children: [
                        Expanded(
                            flex: 1,
                            child: Stack(children: [
                              profDetails.userType.toString() ==
                                      UserType.UserType_Gym_Owner
                                  ? SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.35,
                                      height:
                                          (MediaQuery.of(context).size.width) *
                                              0.35,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            showEBBF.dashBoardData.gymlogo!),
                                      ))
                                  : profDetails.userType.toString() ==
                                          UserType.UserType_Coach
                                      ? SizedBox(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.35,
                                          height: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.35,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                showEBBF
                                                    .dashBoardData.coachlogo!),
                                          ))
                                      : SizedBox(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.35,
                                          height: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.35,
                                          child: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/Dashboarddetailimage.png"),
                                          )),
                              Positioned(
                                  top:
                                      (MediaQuery.of(context).size.width) * 0.2,
                                  left: (MediaQuery.of(context).size.width) *
                                      0.26,
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
                                              .setNavIndex(26);
                                        }),
                                  ))
                            ])),
                        Text(
                          user.fullname.toString(),
                          style: profileUserNameTextstyle(),
                        ),
                        if (profDetails.userType.toString() ==
                            UserType.UserType_Athlete)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BGGreenButton(
                                  title: "EDIT",
                                  onPressed: () {
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setNavIndex(26);
                                  }),
                              BGGreenButton(
                                title: "PRINT",
                                onPressed: () async {
                                  print(await read(
                                      SharedPreferencesConstant.userId));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const WebViewPage(
                                              webUrl:
                                                  "http://www.eis-digital.com/ebbfen/dashboard/printgymdetails/40",
                                            )),
                                  );
                                },
                              )
                            ],
                          ),
                      ]))),
              if (profDetails.userType.toString() ==
                  UserType.UserType_Gym_Owner)
                Card(
                    child: Center(
                        child: Container(
                            padding: const EdgeInsets.all(
                              10, // Space between underline and text
                            ),
                            width: (MediaQuery.of(context).size.width) * 0.90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Introduction",
                                  textAlign: TextAlign.center,
                                  style: profileIntroductionTextstyle(),
                                ),
                                Text(profDetails.introduction.toString()),
                              ],
                            )))),

              if (profDetails.userType.toString() ==
                  UserType.UserType_Gym_Owner)
                Card(
                    child: Center(
                        child: Container(
                  padding: const EdgeInsets.all(
                    10, // Space between underline and text
                  ),
                  width: (MediaQuery.of(context).size.width) * 0.90,
                  child: Text(
                    "Years of Experience : $establishYear",
                    style: profileIntroductionTextstyle(),
                  ),
                ))),
              Card(
                  child: Center(
                      child: Container(
                padding: const EdgeInsets.all(
                  10, // Space between underline and text
                ),
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Text(
                  "Email : ${profDetails.email}",
                  style: profileIntroductionTextstyle(),
                ),
              ))),
              Card(
                  child: Center(
                      child: Container(
                padding: const EdgeInsets.all(
                  10, // Space between underline and text
                ),
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Text(
                  "Contact : ${profDetails.phone}",
                  style: profileIntroductionTextstyle(),
                ),
              ))),
              Card(
                  child: Center(
                      child: Container(
                padding: const EdgeInsets.all(
                  10, // Space between underline and text
                ),
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Text(
                  "FaceBook : ${profDetails.facebookP}",
                  style: profileIntroductionTextstyle(),
                ),
              ))),
              Card(
                  child: Center(
                      child: Container(
                padding: const EdgeInsets.all(
                  10, // Space between underline and text
                ),
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Text(
                  "Twitter : ${profDetails.twitterP}",
                  style: profileIntroductionTextstyle(),
                ),
              ))),
              Card(
                  child: Center(
                      child: Container(
                padding: const EdgeInsets.all(
                  10, // Space between underline and text
                ),
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Text(
                  "Instagram : : ${profDetails.instagramP}",
                  style: profileIntroductionTextstyle(),
                ),
              ))),
              Card(
                  child: Center(
                      child: Container(
                padding: const EdgeInsets.all(
                  10, // Space between underline and text
                ),
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Text(
                  "YouTube : ${profDetails.youtubeP}",
                  style: profileIntroductionTextstyle(),
                ),
              ))),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
            ])),
      );
    });
  }
}
