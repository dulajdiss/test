import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/coach_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachApprovals extends StatefulWidget {
  const CoachApprovals({Key? key}) : super(key: key);

  @override
  State<CoachApprovals> createState() => _CoachApprovalsState();
}

class _CoachApprovalsState extends State<CoachApprovals> {
  String currentSelectedValue = "10";
  List<String> dataList = ["10", "20", "50", "250"];
  int index = 0;
  List<String> achiTitleList = [
    "Last Name",
    "Mobile",
    "Emirate",
    "Photo",
    "ID Front",
    "ID Back",
    "Status",
    "Action"
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<CoachModel> coachList = showEBBF.coachNeedApprovalListValue;
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
                  direction: "Home > Dashboard > Coach Approvals",
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
                            const Text('Show'),
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
                            const Text('Entries'),
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
                                  'First Name',
                                  style: dashBoardAchievement(),
                                )),
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width) * 0.1,
                                  child: IconButton(
                                    icon: const Icon(Icons.navigate_before),
                                    onPressed: () {
                                      setState(() {
                                        if (index == 4) {
                                          index = 2;
                                        } else {
                                          index = 0;
                                        }
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
                                          achiTitleList[0 + index],
                                          style: dashBoardAchievement(),
                                        ))),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: Text(
                                          achiTitleList[1 + index],
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
                                      if (index == 2) {
                                        index = 4;
                                      } else if (index == 0) {
                                        index = 2;
                                      }
                                    });
                                  },
                                ),
                              ]),
                          for (int i = 0; i < coachList.length; i++)
                            Container(
                                color: AppColors.lightGrey,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Divider(),
                                      Expanded(
                                          child: Text(
                                        coachList[i].fullname.toString(),
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
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: index == 0
                                            ? Text(
                                                coachList[i]
                                                    .lastName
                                                    .toString(),
                                                style:
                                                    dashBoardAchievementContain(),
                                              )
                                            : index == 2
                                                ? Text(
                                                    coachList[i]
                                                        .msId
                                                        .toString(),
                                                    style:
                                                        dashBoardAchievementContain(),
                                                  )
                                                : Image.network(
                                                    "${coachList[i].idFront}"),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: index == 0
                                            ? Text(
                                                coachList[i].mobile.toString(),
                                                style:
                                                    dashBoardAchievementContain(),
                                              )
                                            : index == 2
                                                ? Image.network(
                                                    "${coachList[i].photo}")
                                                : Image.network(
                                                    "${coachList[i].idBack}"),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width) *
                                              0.01, // Space between underline and text
                                        ),
                                        child: index == 0
                                            ? Text(
                                                coachList[i].msId.toString(),
                                                style:
                                                    dashBoardAchievementContain(),
                                              )
                                            : index == 2
                                                ? Image.network(
                                                    "${coachList[i].idFront}")
                                                : Text(
                                                    coachList[i]
                                                        .status
                                                        .toString(),
                                                    style:
                                                        dashBoardAchievementContain(),
                                                  ),
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
                                                  ? Image.network(
                                                      "${coachList[i].photo}")
                                                  : index == 2
                                                      ? Image.network(
                                                          "${coachList[i].idBack}")
                                                      : BGGreenButton(
                                                          title: "Reject",
                                                          onPressed:
                                                              () async {},
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
