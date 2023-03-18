// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/dashbord/widget/dashboard_register_data_filed.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/services/fetch/event_registration_service.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DashBoardEventsRegister extends StatefulWidget {
  const DashBoardEventsRegister({Key? key}) : super(key: key);

  @override
  State<DashBoardEventsRegister> createState() =>
      _DashBoardEventsRegisterState();
}

class _DashBoardEventsRegisterState extends State<DashBoardEventsRegister> {
  bool _isSelect = false, categorySelected = false;
  final _formKey = GlobalKey<FormState>();
  String selectedNationality = "Select Nationality";
  List<String>? nationalityDataList = [
    "Select Nationality",
  ];
  String selectedLocation = "Select Location";
  List<String> locationDataList = [];
  DateTime currentDateTime = DateTime.now();

  TextEditingController nameController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  String category = '', dob = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      EventsModel selectedEvent = showEBBF.singleEventDetails;
      locationDataList = [];
      locationDataList.add("Select Location");
      for (int i = 0; i < showEBBF.locationList.length; i++) {
        locationDataList.add(showEBBF.locationList[i].locationTitle!);
      }
      return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            // ignore: prefer_const_constructors
            Stack(children: [
              TitalBoxWithBackButton(
                title: 'DASHBOARD',
                direction: "Home> Dashboard> Events> Register",
                onPress: () async {
                  await Provider.of<EBBFNotifier>(context, listen: false)
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
                  ))
            ]),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.04,
            ),
            Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DashBoardRegisterDataFiled(
                    labelText: "Name *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter ame";
                      } else {}
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    // hintText: "Contact Number *",
                    controller: nameController,
                    labelText: "Contact Number *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      } else {}
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.11,
                      ),
                      child: const Text("Date Of Birth *")),
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.85,
                              child: TextFormField(
                                obscureText: _isSelect,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29.0),
                                  ),
                                  fillColor: AppColors.lightGrey,
                                  filled: true,
                                  labelText: _isSelect
                                      ? DateFormat.yMMMMd()
                                          .format(currentDateTime)
                                      : "dd/mm/yyyy",
                                  suffixIcon: InkWell(
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: currentDateTime,
                                              firstDate: DateTime(1920),
                                              lastDate: DateTime(2004));
                                      if (pickedDate != null &&
                                          pickedDate != currentDateTime)
                                        setState(() {
                                          _isSelect = true;
                                          currentDateTime = pickedDate;
                                        });
                                    },
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: _isSelect
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
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              )))),
                  DashBoardRegisterDataFiled(
                    labelText: "Email Id*",
                    controller: emailController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Email address field is required.";
                      } else {
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value!);

                        return emailValid ? null : "Invalid Email Address";
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Passport Number *",
                    controller: passportNoController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The passport number field is required.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.11,
                      ),
                      child: const Text("Nationality *")),
                  Center(
                      child: RegisterDataDropDown(
                    currentSelectedValue: selectedNationality,
                    onChange: (value) {
                      setState(() {
                        selectedNationality = value;
                      });
                    },
                    dataList: nationalityDataList,
                  )),
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.11,
                      ),
                      child: const Text("Category *")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: (MediaQuery.of(context).size.width) * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29.0),
                            color: AppColors.green,
                          ),
                          child: MaterialButton(
                            textColor: categorySelected
                                ? AppColors.white
                                : AppColors.black,
                            onPressed: () {
                              setState(() {
                                category = "resident";
                                categorySelected = !categorySelected;
                              });
                            },
                            child: const AutoSizeText(
                              "Resident",
                              maxLines: 1,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: (MediaQuery.of(context).size.width) * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29.0),
                            color: AppColors.green,
                          ),
                          child: MaterialButton(
                            textColor: categorySelected
                                ? AppColors.black
                                : AppColors.white,
                            onPressed: () {
                              setState(() {
                                category = "visitor";
                                categorySelected = !categorySelected;
                              });
                            },
                            child: const AutoSizeText(
                              "Visitor",
                              maxLines: 1,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Address *",
                    controller: addressController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Address field is required.";
                      } else {
                        if (value.length > 9) {
                          return null;
                        } else {
                          return "Invalid Mobile Number";
                        }
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Address 2 *",
                    controller: addressTwoController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "ZIP",
                    controller: zipController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "City *",
                    controller: cityController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The city field is required.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "State",
                    controller: stateController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.11,
                      ),
                      child: const Text("Emirate *")),
                  Center(
                    child: RegisterDataDropDown(
                      currentSelectedValue: selectedLocation,
                      onChange: (value) {
                        setState(() {
                          selectedLocation = value;
                        });
                      },
                      dataList: locationDataList,
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            color: AppColors.green,
                            child: MaterialButton(
                              color: AppColors.green,
                              textColor: AppColors.white,
                              child:
                                  AutoSizeText("PAY ${showEBBF.eventFee} AED",
                                      maxLines: 1,
                                      style: GoogleFonts.anton(
                                          textStyle: const TextStyle(
                                        decoration: TextDecoration.none,
                                        color: AppColors.white,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ))),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Map<String, String> registerMap = {};
                                  registerMap['user_id'] = await read(
                                      SharedPreferencesConstant.userId);
                                  registerMap["fullname"] =
                                      nameController.text.toString();
                                  registerMap["mobile"] =
                                      contactNoController.text.toString();
                                  registerMap["dob"] = dob;
                                  registerMap["category"] = category;
                                  registerMap["passport_number"] =
                                      passportNoController.text;
                                  registerMap["emirate"] = selectedLocation;
                                  registerMap["email"] = emailController.text;
                                  registerMap["nationality"] =
                                      selectedNationality;
                                  registerMap["event_name"] =
                                      selectedEvent.title!;
                                  registerMap["event_id"] =
                                      selectedEvent.eventId!;
                                  registerMap["fee"] = await read(
                                      SharedPreferencesConstant.eventFee);
                                  registerMap["address"] =
                                      addressController.text;
                                  registerMap["city"] = cityController.text;
                                  registerMap["zip"] = zipController.text;
                                  registerMap["address_two"] =
                                      addressTwoController.text;
                                  registerMap["state"] = stateController.text;
                                  await eventRegistration(registerMap).then(
                                      (value) async => await Provider.of<
                                                  EBBFNotifier>(context,
                                              listen: false)
                                          .setNavIndex(
                                              showEBBF.previousSelectedIndex));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Data Missing")),
                                  );
                                }
                              },
                            ))))),
          ]));
    });
  }
}
