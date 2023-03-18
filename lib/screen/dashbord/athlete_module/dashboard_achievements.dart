// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/delete_achivement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardAchievement extends StatefulWidget {
  const DashboardAchievement({Key? key}) : super(key: key);

  @override
  State<DashboardAchievement> createState() => _DashboardAchievementState();
}

class _DashboardAchievementState extends State<DashboardAchievement> {
  String currentSelectedValue = "10";
  List<String> dataList = ["10", "20", "50", "250"];
  int index = 0;
  List<String> achiTitleList = [
    "Start Date",
    "End Data",
    "Location",
    "Status",
    "Certification",
    "Action"
  ];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<AchievementsModel> achievementList = showEBBF.achievementListValue;
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              Stack(children: [
                TitalBoxWithBackButton(
                  title: 'DASHBOARD',
                  direction: "Home > Dashboard > Achievements",
                  onPress: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(4);
                  },
                ),
                Positioned(
                    top: (MediaQuery.of(context).size.height) * 0.02,
                    left: (MediaQuery.of(context).size.width) * 0.40,
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.94,
                      height: (MediaQuery.of(context).size.height) * 0.08,
                      child: Image(
                        image: AppImages.dashboarddetailimage,
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        fit: BoxFit.contain,
                      ),
                    )),
                Positioned(
                    top: (MediaQuery.of(context).size.height) * 0.099,
                    left: (MediaQuery.of(context).size.width) * 0.77,
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.22,
                      height: (MediaQuery.of(context).size.height) * 0.08,
                      child: AutoSizeText(
                        "Hi ${showEBBF.currentUser.fullname} !",
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))
              ]),
              Padding(
                  padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width) *
                        0.04, // Space between underline and text
                  ),
                  child: BGGreenButton(
                    title: "Add",
                    onPressed: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(9);
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.all(
                        (MediaQuery.of(context).size.width) *
                            0.04, // Space between underline and text
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Show'),
                            Padding(
                                padding: EdgeInsets.only(
                                  left: (MediaQuery.of(context).size.width) *
                                      0.03,
                                  right: (MediaQuery.of(context).size.width) *
                                      0.03, // Space between underline and text
                                ),
                                child: Container(
                                    padding: EdgeInsets.all(4),
                                    color: AppColors.lightGrey,
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                      value: currentSelectedValue,
                                      iconEnabledColor: AppColors.green,
                                      iconSize: 20,
                                      isDense: true,
                                      onChanged: (val) {
                                        setState(() {
                                          currentSelectedValue = val!;
                                        });
                                      },
                                      items: dataList!.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    )))),
                            Text('Entries'),
                          ])),
                  Padding(
                      padding: EdgeInsets.all(
                        (MediaQuery.of(context).size.width) *
                            0.04, // Space between underline and text
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Search'),
                          Padding(
                              padding: EdgeInsets.only(
                                left:
                                    (MediaQuery.of(context).size.width) * 0.01,
                                // Space between underline and text
                              ),
                              child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width) * 0.2,
                                  padding: EdgeInsets.all(4),
                                  color: AppColors.lightGrey,
                                  child: Icon(Icons.search)))
                        ],
                      )),
                ],
              ),
              Center(
                child: SizedBox(
                    width: (MediaQuery.of(context).size.width) * 0.94,
                    // height: (MediaQuery.of(context).size.height) * 0.08,
                    child: Card(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Text(
                                  'Event Name',
                                  style: dashBoardAchievement(),
                                )),
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width) * 0.1,
                                  child: IconButton(
                                    icon: const Icon(Icons.navigate_before),
                                    onPressed: () {
                                      setState(() {
                                        index = 0;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: Text(
                                          achiTitleList[0],
                                          style: dashBoardAchievement(),
                                        ))),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: Text(
                                          achiTitleList[1],
                                          style: dashBoardAchievement(),
                                        ))),
                                FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: Text(
                                          achiTitleList[2 + index],
                                          style: dashBoardAchievement(),
                                        ))),
                                FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: Text(
                                          achiTitleList[3 + index],
                                          style: dashBoardAchievement(),
                                        ))),
                                IconButton(
                                  icon: const Icon(Icons.navigate_next),
                                  onPressed: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                ),
                              ]),
                          for (int i = 0; i < achievementList.length; i++)
                            Container(
                                color: AppColors.lightGrey,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Divider(),
                                      Expanded(
                                          child: Text(
                                        achievementList[i].title.toString(),
                                        style: dashBoardAchievementContain(),
                                      )),
                                      SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.03,
                                      ),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width) *
                                                    0.01, // Space between underline and text
                                              ),
                                              child: Text(
                                                achievementList[i]
                                                    .startDate
                                                    .toString(),
                                                style:
                                                    dashBoardAchievementContain(),
                                              ))),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width) *
                                                    0.01, // Space between underline and text
                                              ),
                                              child: Text(
                                                achievementList[i]
                                                    .endDate
                                                    .toString(),
                                                style:
                                                    dashBoardAchievementContain(),
                                              ))),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: index == 0
                                            ? Text(achievementList[i]
                                                .location
                                                .toString())
                                            : Image.network(achievementList[i]
                                                .certificate
                                                .toString()),
                                      )),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width) *
                                                    0.01, // Space between underline and text
                                              ),
                                              child: index == 0
                                                  ? Text(
                                                      achievementList[i]
                                                          .status
                                                          .toString(),
                                                      style:
                                                          dashBoardAchievementContain(),
                                                    )
                                                  : loading
                                                      ? const BGGreenCircularProgress()
                                                      : BGGreenButton(
                                                          title: "Delete",
                                                          onPressed: () async {
                                                            setState(() {
                                                              loading =
                                                                  !loading;
                                                            });
                                                            await deleteAchievements(
                                                                achievementList[
                                                                        i]
                                                                    .acId
                                                                    .toString());
                                                            await apiServiceHelper(
                                                                context,
                                                                APIName
                                                                    .ACHIEVEMENT);
                                                            setState(() {
                                                              loading =
                                                                  !loading;
                                                            });
                                                          },
                                                        ))),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                    ])),
                        ]))),
              )
            ])),
      );
    });
  }
}
