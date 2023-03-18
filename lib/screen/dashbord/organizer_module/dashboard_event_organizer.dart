// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/delete_achivement.dart';
import 'package:ebbf/services/fetch/delete_organizer_events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardEventsOrganizer extends StatefulWidget {
  const DashboardEventsOrganizer({Key? key}) : super(key: key);

  @override
  State<DashboardEventsOrganizer> createState() =>
      _DashboardEventsOrganizerState();
}

class _DashboardEventsOrganizerState extends State<DashboardEventsOrganizer> {
  String currentSelectedValue = "10";
  List<String> dataList = ["10", "20", "50", "250"];
  int index = 0;
  List<String> achiTitleList = [
    "Start Date",
    "End Data",
    "Amount",
    "Status",
    "Pic",
    "Action"
  ];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<EventsModel> organizerEventsLis = showEBBF.organizerEventsListValue;
      return Scaffold(
          body: RefreshIndicator(
        onRefresh: () async => await apiServiceHelper(context, APIName.EVENTS),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              Stack(children: [
                TitalBoxWithBackButton(
                  title: 'DASHBOARD',
                  direction: "Home > Dashboard > Events",
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
                          .setNavIndex(42);
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setSelectedEID("");
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
                          for (int i = 0; i < organizerEventsLis.length; i++)
                            Container(
                                color: AppColors.lightGrey,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Divider(),
                                      Expanded(
                                          child: Text(
                                        organizerEventsLis[i]
                                            .eventName
                                            .toString(),
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
                                                organizerEventsLis[i]
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
                                                organizerEventsLis[i]
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
                                            ? Text(organizerEventsLis[i]
                                                .amount
                                                .toString())
                                            : SizedBox(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width) *
                                                    0.15,
                                                height: (MediaQuery.of(context)
                                                        .size
                                                        .height) *
                                                    0.06,
                                                child: Image.network(
                                                    organizerEventsLis[i]
                                                        .pic
                                                        .toString())),
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
                                                      organizerEventsLis[i]
                                                          .status
                                                          .toString(),
                                                      style:
                                                          dashBoardAchievementContain(),
                                                    )
                                                  : loading
                                                      ? const BGGreenCircularProgress()
                                                      : Column(children: [
                                                          SizedBox(
                                                              width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                                  0.2,
                                                              height: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) *
                                                                  0.025,
                                                              child:
                                                                  BGGreenButton(
                                                                title:
                                                                    " Edit    ",
                                                                onPressed:
                                                                    () async {
                                                                  setState(() {
                                                                    loading =
                                                                        !loading;
                                                                  });
                                                                  Provider.of<EBBFNotifier>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .setNavIndex(
                                                                          42);
                                                                  Provider.of<EBBFNotifier>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .setSelectedEID(
                                                                          organizerEventsLis[i]
                                                                              .eId!);
                                                                  setState(() {
                                                                    loading =
                                                                        !loading;
                                                                  });
                                                                },
                                                              )),
                                                          SizedBox(
                                                              width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                                  0.2,
                                                              height: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) *
                                                                  0.025,
                                                              child:
                                                                  BGGreenButton(
                                                                title: "Delete",
                                                                onPressed:
                                                                    () async {
                                                                  setState(() {
                                                                    loading =
                                                                        !loading;
                                                                  });
                                                                  await deleteOrganizerEvents(
                                                                      organizerEventsLis[
                                                                              i]
                                                                          .eId
                                                                          .toString());
                                                                  await apiServiceHelper(
                                                                      context,
                                                                      APIName
                                                                          .ORGANIZERUNIQUE);
                                                                  setState(() {
                                                                    loading =
                                                                        !loading;
                                                                  });
                                                                },
                                                              ))
                                                        ]))),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                    ])),
                        ]))),
              )
            ])),
      ));
    });
  }
}
