import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/models/noc_module.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/e_services/widget/box_text_icon.dart';
import 'package:ebbf/screen/dashbord/gym_module/widget/issuing_noc_for_coach.dart';
import 'package:ebbf/screen/dashbord/gym_module/widget/noc_for_changing_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NOCPage extends StatefulWidget {
  const NOCPage({Key? key}) : super(key: key);

  @override
  State<NOCPage> createState() => _NOCPageState();
}

class _NOCPageState extends State<NOCPage> {
  List<String> eventDataList = [];
  String currentCodeSelectedValue = "Select NOC to Download",
      nocTypeIndex = "",nocCoachIndex="",
      currentCoachSelectedValue = "Select Coach";
  bool coach = false;
  bool code = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<NOCMainDropModule> nocMainDrop = showEBBF.nocMainDrop;
      List<NOCSubDropModule> nocSubDrop = showEBBF.nocSubDrop;
      return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            // ignore: prefer_const_constructors
            TitalBoxWithBackButton(
              title: 'PROFILE',
              direction: "Home > Profile > NOC",
              onPress: () {
                Provider.of<EBBFNotifier>(context, listen: false)
                    .setNavIndex(4);
              },
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.width) * 0.05,
                    left: (MediaQuery.of(context).size.width) * 0.05),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: (MediaQuery.of(context).size.width) * 0.475,
                          child: Text("Choose the NOC type:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    (MediaQuery.of(context).size.width) * 0.035,
                              ))),
                      Container(
                          margin: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.width) * 0.04,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.zero,
                            color: AppColors.white,
                          ),
                          child: BoxTextIcon(
                              box_color: AppColors.white,
                              box_text: currentCodeSelectedValue,
                              box_text_color: AppColors.black,
                              box_icon: code
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                              box_onpress: () {
                                setState(() {
                                  code = !code;
                                });
                              }))
                    ])),
            if (code)
              for (int i = 0; i < nocMainDrop.length; i++)
                IssuingNOCForCoach(
                  color: AppColors.green,
                  currentCodeSelectedValue: nocMainDrop[i].title,
                  onChange: () {
                    setState(() {
                      currentCodeSelectedValue = nocMainDrop[i].title!;
                      nocTypeIndex = nocMainDrop[i].lId!;
                      code = !code;
                    });
                  },
                ),

            SizedBox(
              height: (MediaQuery.of(context).size.width) * 0.05,
            ),

            if (nocTypeIndex != "8")
              Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width) * 0.05,
                      right: (MediaQuery.of(context).size.width) * 0.05),
                  child: NOCForChangingTable(nocList: showEBBF.nocList)),
            if (nocTypeIndex == "8")
              Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width) * 0.05,
                      right: (MediaQuery.of(context).size.width) * 0.05),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: (MediaQuery.of(context).size.width) * 0.475,
                            child: Text("Select the Coach Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      (MediaQuery.of(context).size.width) *
                                          0.035,
                                ))),
                        Container(
                            margin: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.width) * 0.04,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.zero,
                              color: AppColors.white,
                            ),
                            child: BoxTextIcon(
                                box_color: AppColors.white,
                                box_text: currentCoachSelectedValue,
                                box_text_color: AppColors.black,
                                box_icon: coach
                                    ? const Icon(Icons.arrow_drop_up)
                                    : const Icon(Icons.arrow_drop_down),
                                box_onpress: () {
                                  setState(() {
                                    coach = !coach;
                                  });
                                }))
                      ])),
            if (coach)
              for (int io = 0; io < nocSubDrop.length; io++)
                IssuingNOCForCoach(
                  color: AppColors.green,
                  currentCodeSelectedValue: nocSubDrop[io].coach,
                  onChange: () {
                    setState(() {
                      currentCoachSelectedValue = nocSubDrop[io].coach!;
                      // nocCoachIndex = nocSubDrop[io].lId!;
                      coach = !coach;
                    });
                  },
                ),
          ])));
    });
  }
}
