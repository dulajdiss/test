// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/sport_associated.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/fetch_delete_sport_associated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardSportAssociated extends StatefulWidget {
  const DashboardSportAssociated({Key? key}) : super(key: key);

  @override
  State<DashboardSportAssociated> createState() =>
      _DashboardSportAssociatedState();
}

class _DashboardSportAssociatedState extends State<DashboardSportAssociated> {
  String currentSelectedValue = "10";
  int loading = -1;
  List<String> dataList = ["10", "20", "50", "250"];

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<SportAssociate> sportAssList = showEBBF.sportAssociateListValue;
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
                  direction: "Home > Sport Associated",
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
                      // apiServiceHelper(context, APIName.SPORTASSOCIATE);
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(40);
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
                                  padding: const EdgeInsets.all(4),
                                  color: AppColors.lightGrey,
                                  child: const Icon(Icons.search)))
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
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          left: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.05,
                                        ),
                                        child: Text(
                                          'Sport Name',
                                          style: dashBoardAchievement(),
                                        ))),
                                // SizedBox(
                                //   width:
                                //       (MediaQuery.of(context).size.width) * 0.1,
                                //   child: IconButton(
                                //     icon: const Icon(Icons.navigate_before),
                                //     onPressed: () {
                                //       setState(() {
                                //         index = 0;
                                //       });
                                //     },
                                //   ),
                                // ),
                                FittedBox(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          left: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.1,
                                          top: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.02,
                                          bottom: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.02,
                                          right: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.1, // Space between underline and text
                                        ),
                                        child: Text(
                                          "Action",
                                          style: dashBoardAchievement(),
                                        ))),
                                // IconButton(
                                //   icon: const Icon(Icons.navigate_next),
                                //   onPressed: () {
                                //     setState(() {
                                //       index = 2;
                                //     });
                                //   },
                                // ),
                              ]),
                          for (int i = 0; i < sportAssList.length; i++)
                            Container(
                                color: AppColors.lightGrey,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Divider(),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .width) *
                                                      0.02 // Space between underline and text
                                                  ),
                                              child: Text(
                                                sportAssList[i]
                                                    .title
                                                    .toString(),
                                                style:
                                                    dashBoardAchievementContain(),
                                              ))),
                                      SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.03,
                                      ),
                                      SizedBox(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.23,
                                          height: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.12,
                                          child: Padding(
                                              padding: const EdgeInsets.all(
                                                  10 // Space between underline and text
                                                  ),
                                              child: loading == i
                                                  ? const BGGreenCircularProgress()
                                                  : BGGreenButton(
                                                      title: "Delete",
                                                      onPressed: () async {
                                                        setState(() {
                                                          loading = i;
                                                        });
                                                        await fetchDeleteSportsAssociated(
                                                                sportAssList[i]
                                                                    .saId!)
                                                            .then(
                                                                (value) async {
                                                          await apiServiceHelper(
                                                              context,
                                                              APIName
                                                                  .SPORTASSOCIATE);
                                                          setState(() {
                                                            loading = -1;
                                                          });
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
