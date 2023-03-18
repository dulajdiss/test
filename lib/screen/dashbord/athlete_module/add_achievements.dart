import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/fetch_add_achievements.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAchievement extends StatefulWidget {
  const AddAchievement({Key? key}) : super(key: key);

  @override
  State<AddAchievement> createState() => _AddAchievementState();
}

class _AddAchievementState extends State<AddAchievement> {
  String selectedEventName = "Select Name";
  List<String> eventDataList = ["Select Name"];
  late FilePicker imagePicker;
  String? imagePath = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<EventsModel> eventList = showEBBF.eventsListValue;
      eventDataList = [];
      eventDataList.add("Select Name");
      for (int j = 0; j < eventList.length; j++) {
        eventDataList.add(eventList[j].title.toString());
      }
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              Stack(children: [
                TitalBoxWithBackButton(
                  title: 'DASHBOARD',
                  direction: "Home > Dashboard > \nAdd Achievements",
                  onPress: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(showEBBF.previousSelectedIndex);
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
                    )),
              ]),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width) * 0.80,
                  child:
                      Text("Event Name *", style: profileUserNameTextstyle())),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.80,
                child: RegisterDataDropDown(
                  currentSelectedValue: selectedEventName,
                  onChange: (value) {
                    setState(() {
                      selectedEventName = value;
                    });
                  },
                  dataList: eventDataList,
                ),
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width) * 0.80,
                  child: Text(
                    "Certificate *",
                    style: profileUserNameTextstyle(),
                  )),
              Container(
                width: (MediaQuery.of(context).size.width) * 0.80,
                height: (MediaQuery.of(context).size.height) * 0.080,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Padding(
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.05,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: MaterialButton(
                          height: (MediaQuery.of(context).size.height) * 0.050,
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'png'],
                            );
                            if (result?.files[0].path != null) {
                              print("result Path => ${result?.files[0].path}");
                              setState(() {
                                imagePath = result?.files[0].path;
                              });
                            }
                          },
                          color: AppColors.white,
                          child: const Text('Choose File'),
                        )),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(
                                  left: (MediaQuery.of(context).size.width) *
                                      0.05,
                                ),
                                child: (imagePath == "")
                                    ? const Text("No File Chosen")
                                    : Text(imagePath!.split('/').last))),
                      ],
                    )),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              loading
                  ? const BGGreenCircularProgress()
                  : BGGreenButton(
                      title: "SUBMIT",
                      onPressed: () async {
                        if (imagePath != '' &&
                            selectedEventName != "Select Name") {
                          String eventId = '';
                          setState(() {
                            loading = !loading;
                          });
                          for (int j = 0; j < eventList.length; j++) {
                            if (selectedEventName ==
                                eventList[j].title.toString()) {
                              eventId = eventList[j].eventId.toString();
                            }
                          }
                          await fetchAddAchievements(
                              eventId, File(imagePath.toString()));
                          await apiServiceHelper(context, APIName.ACHIEVEMENT);
                          await Provider.of<EBBFNotifier>(context,
                                  listen: false)
                              .setNavIndex(10);
                          setState(() {
                            loading = !loading;
                          });
                        } else {}
                      },
                    )
            ])),
      );
    });
  }
}
