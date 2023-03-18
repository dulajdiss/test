import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/gym_activities_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GymActivities extends StatefulWidget {
  const GymActivities({Key? key}) : super(key: key);

  @override
  State<GymActivities> createState() => _GymActivitiesState();
}

class _GymActivitiesState extends State<GymActivities> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<GymActivityModel> gymActList = showEBBF.gymsActivityListValue;
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
                direction: "Home > Dashboard > Gym Activities",
                onPress: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(showEBBF.previousSelectedIndex);
                },
              ),

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
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: gymActList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 50,
                                child: Center(
                                    child: Text(
                                  '* ${gymActList[index].activity}',
                                  style: dashBoardAchievement(),
                                )),
                              );
                            })),
                  )))
            ])),
      );
    });
  }
}
