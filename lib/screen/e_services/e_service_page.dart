// ignore_for_file: unnecessary_null_comparison

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/models/eservices_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/e_services/widget/green_white_boxs.dart';
import 'package:ebbf/screen/e_services/widget/box_text_icon.dart';
import 'package:ebbf/screen/dashbord/widget/check_box_with_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EServicesPage extends StatefulWidget {
  const EServicesPage({Key? key}) : super(key: key);

  @override
  State<EServicesPage> createState() => _EServicesPageState();
}

class _EServicesPageState extends State<EServicesPage> {
  int index = 0;
  EServiceModel? selectEService;
  bool gymShow = false, coachShow = false, athleticShow = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<EServiceModel> eServiceList = showEBBF.eServicesList;

      return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_constructors
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
            // ignore: prefer_const_constructors
            TitalBoxWithBackButton(
              title: 'E-SERVICES',
              direction: "Home > E-services",
              onPress: () {
                Provider.of<EBBFNotifier>(context, listen: false)
                    .setNavIndex(showEBBF.previousSelectedIndex);
              },
            ),
            Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.05),
                child: Text("Issue NOC for Trade License Renewal",
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width) * 0.04,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold))),
            Center(
                child: BoxTextIcon(
                    box_color: AppColors.green,
                    box_text: "GYM",
                    box_text_color: AppColors.white,
                    box_icon: gymShow
                        ? const Icon(Icons.remove)
                        : const Icon(Icons.add),
                    box_onpress: () {
                      setState(() {
                        gymShow = !gymShow;
                        coachShow = false;
                        athleticShow = false;
                      });
                    })),
            if (gymShow)
              Center(
                  child: Container(
                      color: AppColors.black,
                      width: (MediaQuery.of(context).size.width) * 0.90,
                      padding: const EdgeInsets.all(3),
                      child: Column(children: [
                        for (int i = 0; i < eServiceList.length; i++)
                          if (eServiceList[i].name == Name.GYM)
                            CheckBoxWithText(
                              title: eServiceList[i].submenu,
                              value: index == i,
                              onChnage: (bool? value) {
                                setState(() {
                                  selectEService = eServiceList[i];
                                  index = i;
                                });
                              },
                            )
                      ]))),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.015,
            ),
            Center(
                child: BoxTextIcon(
                    box_color: AppColors.green,
                    box_text: "Coach",
                    box_text_color: AppColors.white,
                    box_icon: coachShow
                        ? const Icon(Icons.remove)
                        : const Icon(Icons.add),
                    box_onpress: () {
                      setState(() {
                        coachShow = !coachShow;
                        gymShow = false;
                        athleticShow = false;
                      });
                    })),
            if (coachShow)
              Center(
                  child: Container(
                      color: AppColors.black,
                      width: (MediaQuery.of(context).size.width) * 0.90,
                      padding: const EdgeInsets.all(3),
                      child: Column(children: [
                        for (int i = 0; i < eServiceList.length; i++)
                          if (eServiceList[i].name == Name.COACH)
                            CheckBoxWithText(
                              title: eServiceList[i].submenu,
                              value: index == i,
                              onChnage: (bool? value) {
                                setState(() {
                                  selectEService = eServiceList[i];
                                  index = i;
                                });
                              },
                            )
                      ]))),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.015,
            ),
            Center(
                child: BoxTextIcon(
                    box_color: AppColors.green,
                    box_text: "Athlete",
                    box_text_color: AppColors.white,
                    box_icon: athleticShow
                        ? const Icon(Icons.remove)
                        : const Icon(Icons.add),
                    box_onpress: () {
                      setState(() {
                        athleticShow = !athleticShow;
                        gymShow = false;
                        coachShow = false;
                      });
                    })),
            if (athleticShow)
              Center(
                  child: Container(
                      color: AppColors.black,
                      width: (MediaQuery.of(context).size.width) * 0.90,
                      padding: const EdgeInsets.all(3),
                      child: Column(children: [
                        for (int i = 0; i < eServiceList.length; i++)
                          if (eServiceList[i].name == Name.ATHLETE)
                            CheckBoxWithText(
                              title: eServiceList[i].submenu,
                              value: index == i,
                              onChnage: (bool? value) {
                                setState(() {
                                  selectEService = eServiceList[i];
                                  index = i;
                                });
                              },
                            )
                      ]))),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.015,
            ),
            Center(
                child: Container(
                    alignment: const Alignment(-1, 0),
                    color: AppColors.black,
                    height: (MediaQuery.of(context).size.width) * 0.12,
                    width: (MediaQuery.of(context).size.width) * 0.90,
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.04),
                    child: Text(
                      selectEService == null
                          ? eServiceList[0]!.tableHeading!
                          : selectEService!.tableHeading!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: (MediaQuery.of(context).size.width) * 0.03,
                      ),
                    ))),

            GreenAndWhiteBox(
              description: selectEService == null
                  ? eServiceList[0]!.description!
                  : selectEService!.description!,
              title: "Description",
            ),

            GreenAndWhiteBox(
              description: selectEService == null
                  ? eServiceList[0].requiredDocument
                  : selectEService!.requiredDocument,
              title: "Request Document",
            ),

            GreenAndWhiteBox(
              description: selectEService == null
                  ? eServiceList[0]!.serviceFee!
                  : selectEService!.serviceFee!,
              title: "Service Fee",
            ),

            GreenAndWhiteBox(
              description: selectEService == null
                  ? eServiceList[0]!.termsConditions!
                  : selectEService!.termsConditions!,
              title: "Terms and Condition",
            ),

              GreenAndWhiteBox(
                description: selectEService == null
                    ? eServiceList[0]!.serviceProcedure!
                    : selectEService!.serviceProcedure!,
                title: "Service Procedure",
              ),

              GreenAndWhiteBox(
                description: selectEService == null
                    ? eServiceList[0]!.serviceDirectContact!
                    : selectEService!.serviceDirectContact!,
                title: "Service Direct Contact",
              )
          ])));
    });
  }
}
