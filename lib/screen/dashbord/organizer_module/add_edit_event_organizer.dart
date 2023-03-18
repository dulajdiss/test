// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/dashbord/widget/dashboard_register_data_filed.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/fetch_membership.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

class AddEventsOrganizer extends StatefulWidget {
  const AddEventsOrganizer({Key? key}) : super(key: key);

  @override
  State<AddEventsOrganizer> createState() => _AddEventsOrganizerState();
}

class _AddEventsOrganizerState extends State<AddEventsOrganizer> {
  String selectedSportName = "Select Sport Name",
      // eventName = "",
      // amount = "",
      // guest = "",
      // eventDateAndTime = "",
      // description = "",
      thumbnailImagePath = "",
      innerImagePath = "";
  final _formKey = GlobalKey<FormState>();
  List<String> sportDataList = ["Select Sport Name"], sportIDList = [];
  late FilePicker imagePicker;
  bool loading = false, _isSelectStart = false, _isSelectEnd = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController guestController = TextEditingController();
  TextEditingController eventDateTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<SportsModels> sportList = showEBBF.sportsListValue;
      String eId = showEBBF.selectedEId;
      sportDataList = [];
      sportDataList.add('Select Sport Name');
      sportIDList = [];
      sportIDList.add('Select Sport Name');
      for (int j = 0; j < sportList.length; j++) {
        sportDataList.add(sportList[j].title.toString());
        sportIDList.add(sportList[j].sId.toString());
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
                  direction: eId == ""
                      ? "Home > Dashboard > Add Event"
                      : "Home > Dashboard > Edit Event",
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
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("Event Name *",
                            style: profileUserNameTextstyle())),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.85,
                      child: DashBoardRegisterDataFiled(
                        controller: eventNameController,
                        validator: (String? value) {
                          print('KÔooooooooo');
                          if (value == null || value.isEmpty) {
                            return "Please enter event name";
                          } else {
                            // setState(() {
                            //   eventName = value;
                            // });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("Start Date *",
                            style: profileUserNameTextstyle())),
                    Center(
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.80,
                                child: TextFormField(
                                  obscureText: _isSelectStart,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    fillColor: AppColors.lightGrey,
                                    filled: true,
                                    labelText: _isSelectStart
                                        ? DateFormat.yMMMMd().format(startDate)
                                        : "dd/mm/yyyy",
                                    suffixIcon: InkWell(
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: startDate,
                                                firstDate: DateTime(1920),
                                                lastDate: DateTime(2124));
                                        if (pickedDate != null &&
                                            pickedDate != startDate) {
                                          setState(() {
                                            _isSelectStart = true;
                                            startDate = pickedDate;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: _isSelectStart
                                            ? AppColors.green
                                            : AppColors.grey,
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (String? value) {
                                    // setState(() {
                                    //   password = value!;
                                    // });
                                    return (value != null &&
                                            value.contains('@'))
                                        ? 'Do not use the @ char.'
                                        : null;
                                  },
                                )))),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("End Date *",
                            style: profileUserNameTextstyle())),
                    Center(
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.80,
                                child: TextFormField(
                                  obscureText: _isSelectEnd,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    fillColor: AppColors.lightGrey,
                                    filled: true,
                                    labelText: _isSelectEnd
                                        ? DateFormat.yMMMMd().format(endDate)
                                        : "dd/mm/yyyy",
                                    suffixIcon: InkWell(
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: endDate,
                                                firstDate: DateTime(1920),
                                                lastDate: DateTime(2124));
                                        if (pickedDate != null &&
                                            pickedDate != endDate) {
                                          setState(() {
                                            _isSelectEnd = true;
                                            endDate = pickedDate;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: _isSelectEnd
                                            ? AppColors.green
                                            : AppColors.grey,
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  // validator: (String? value) {
                                  //   // setState(() {
                                  //   //   password = value!;
                                  //   // });
                                  //   return (value != null && value.contains('@'))
                                  //       ? 'Do not use the @ char.'
                                  //       : null;
                                  // },
                                )))),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("Amount *",
                            style: profileUserNameTextstyle())),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.85,
                      child: DashBoardRegisterDataFiled(
                        controller: amountController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event name";
                          } else {
                            // setState(() {
                            //   amount = value;
                            // });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child:
                            Text("Guest *", style: profileUserNameTextstyle())),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.85,
                      child: DashBoardRegisterDataFiled(
                        controller: guestController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event name";
                          } else {
                            // setState(() {
                            //   guest = value;
                            // });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("Sport Name *",
                            style: profileUserNameTextstyle())),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.85,
                      child: RegisterDataDropDown(
                        currentSelectedValue: selectedSportName,
                        onChange: (value) {
                          setState(() {
                            selectedSportName = value;
                          });
                        },
                        dataList: sportDataList,
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("Event Date & Time *",
                            style: profileUserNameTextstyle())),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.85,
                      child: DashBoardRegisterDataFiled(
                        controller: eventDateTimeController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event name";
                          } else {
                            // setState(() {
                            //   eventDateAndTime = value;
                            // });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text("Description *",
                            style: profileUserNameTextstyle())),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.85,
                      child: DashBoardRegisterDataFiled(
                        controller: descriptionController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter event name";
                          } else {
                            // setState(() {
                            //   description = value;
                            // });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text(
                          "Event Thumbnail Image *",
                          style: profileUserNameTextstyle(),
                        )),
                    Container(
                      width: (MediaQuery.of(context).size.width) * 0.80,
                      height: (MediaQuery.of(context).size.height) * 0.075,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        border: Border.all(color: AppColors.grey, width: 1.5),
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
                                height: (MediaQuery.of(context).size.height) *
                                    0.050,
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png'],
                                  );
                                  if (result?.files[0].path != null) {
                                    print(
                                        "result Path => ${result?.files[0].path}");
                                    setState(() {
                                      thumbnailImagePath =
                                          result!.files[0]!.path!;
                                    });
                                  }
                                },
                                color: (thumbnailImagePath == "")
                                    ? AppColors.white
                                    : AppColors.green,
                                child: const Text('Choose File'),
                              )),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.05,
                                      ),
                                      child: (thumbnailImagePath == "")
                                          ? const Text("No File Chosen")
                                          : Text(thumbnailImagePath!
                                              .split('/')
                                              .last))),
                            ],
                          )),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        child: Text(
                          "Inner Image *",
                          style: profileUserNameTextstyle(),
                        )),
                    Container(
                      width: (MediaQuery.of(context).size.width) * 0.80,
                      height: (MediaQuery.of(context).size.height) * 0.075,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        border: Border.all(color: AppColors.grey, width: 1.5),
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
                                height: (MediaQuery.of(context).size.height) *
                                    0.050,
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png'],
                                  );
                                  if (result?.files[0].path != null) {
                                    print(
                                        "result Path => ${result?.files[0].path}");
                                    setState(() {
                                      innerImagePath = result!.files[0]!.path!;
                                    });
                                  }
                                },
                                color: (innerImagePath == "")
                                    ? AppColors.white
                                    : AppColors.green,
                                child: const Text('Choose File'),
                              )),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.05,
                                      ),
                                      child: (innerImagePath == "")
                                          ? const Text("No File Chosen")
                                          : Text(innerImagePath!
                                              .split('/')
                                              .last))),
                            ],
                          )),
                    ),
                  ])),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.03,
              ),
              loading
                  ? const BGGreenCircularProgress()
                  : BGGreenButton(
                      title: "SUBMIT",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (selectedSportName != "Select Sport Name") {
                            String eventId = '';
                            setState(() {
                              loading = !loading;
                            });
                            for (int j = 0; j < sportList.length; j++) {
                              if (selectedSportName ==
                                  sportList[j].title.toString()) {
                                eventId = sportList[j].sId.toString();
                              }
                            }
                            var uri;
                            if (eId == "") {
                              uri = Uri.http(APIConstants.MAIN_BASE_URL,
                                  APIConstants.ADD_ORGANIZER_EVENTS);
                            } else {
                              uri = Uri.http(APIConstants.MAIN_BASE_URL,
                                  APIConstants.EDIT_ORGANIZER_EVENTS);
                            }
                            var request = http.MultipartRequest('POST', uri);
                            if (eId != "") {
                              request.fields["e_id"] = eId;
                            }
                            // print(eventName + description + 'okooejdijeidjn');
                            request.fields['user_id'] =
                                await read(SharedPreferencesConstant.userId);
                            request.fields["title"] = eventNameController.text;
                            request.fields["description"] =
                                descriptionController.text.toString();
                            request.fields["s_date"] = startDate.toString();
                            request.fields["end_date"] = endDate.toString();
                            request.fields["amount"] = amountController.text;
                            request.fields["guests"] = guestController.text;
                            request.fields["event_date"] =
                                eventDateTimeController.text;
                            request.fields["sport"] = eventId;
                            request.files.add(await http.MultipartFile.fromPath(
                                'pic',
                                File(thumbnailImagePath.toString())
                                    .path
                                    .toString(),
                                contentType: MediaType('image', 'png')));

                            request.files.add(await http.MultipartFile.fromPath(
                                'guest_pic',
                                File(innerImagePath.toString()).path.toString(),
                                contentType: MediaType('image', 'png')));
                            print('YooooKK Add Event ORG KKooooY =>$uri ');
                            print(request.fields);

                            await imageUploadingAPICall(request)
                                .then((value) async {
                              await apiServiceHelper(
                                  context, APIName.ORGANIZERUNIQUE);
                              setState(() {
                                loading = !loading;
                              });
                              await Provider.of<EBBFNotifier>(context,
                                      listen: false)
                                  .setNavIndex(41);
                            });
                          } else {}
                        }
                      },
                    ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.03,
              ),
            ])),
      );
    });
  }
}
