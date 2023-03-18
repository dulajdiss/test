// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:ebbf/models/image_upload_models.dart';
import 'package:ebbf/screen/web_view_page.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/dashbord/widget/dashboard_register_data_filed.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/services/fetch/fetch_membership.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DashBoardMemberShip extends StatefulWidget {
  const DashBoardMemberShip({Key? key}) : super(key: key);

  @override
  State<DashBoardMemberShip> createState() => _DashBoardMemberShipState();
}

class _DashBoardMemberShipState extends State<DashBoardMemberShip> {
  bool _isSelect = false;
  final _formKey = GlobalKey<FormState>();
  String photoImagePath = '', frontIdImagePath = '', backIdImagePath = '';
  List<String>? nationalityDataList = [
    "Select Nationality",
  ];
  String selectedLocation = "Select Location";
  List<String> locationDataList = [];
  DateTime currentDateTime = DateTime.now();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController membershipTypeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  // TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      UserModel currentUser = showEBBF.currentUser;
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
                direction: "Home > Dashboard > Membership",
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
                    controller: firstNameController,
                    labelText: "First Name *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter first name";
                      } else {}
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    controller: lastnameController,
                    labelText: "Last Name *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter last name";
                      } else {}
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    // hintText: "Contact Number *",
                    controller: mobileController,
                    labelText: "Mobile Number ",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter mobile name";
                      } else {}
                    },
                  ),
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
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: currentDateTime,
                                              firstDate: DateTime(1920),
                                              lastDate: DateTime(2124));
                                      if (pickedDate != null &&
                                          pickedDate != currentDateTime) {
                                        setState(() {
                                          _isSelect = true;
                                          currentDateTime = pickedDate;
                                        });
                                      }
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
                                  // setState(() {
                                  //   password = value!;
                                  // });
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              )))),
                  // Padding(
                  //     padding: EdgeInsets.only(
                  //       top: (MediaQuery.of(context).size.width) * 0.02,
                  //       left: (MediaQuery.of(context).size.width) * 0.11,
                  //     ),
                  //     child: const Text("Nationality *")),
                  DashBoardRegisterDataFiled(
                    labelText: "Nationality *",
                    controller: nationalityController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The nationality field is required.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Passport Number *",
                    controller: passportController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Passport number field is required.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Membership Type *",
                    controller: membershipTypeController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The type field is required.";
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
                  DashBoardRegisterDataFiled(
                    labelText: "Address *",
                    controller: address1Controller,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Address field is required.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Address 2 *",
                    controller: address2Controller,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "City",
                    controller: cityController,
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
                  if (currentUser.userType == UserType.UserType_Coach)
                    DashBoardRegisterDataFiled(
                      labelText: "Fee",
                      controller: feeController,
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
                      child: const Text("Attachment ")),
                  Padding(
                      padding: EdgeInsets.all(
                        (MediaQuery.of(context).size.width) * 0.01,
                      ),
                      child: Center(
                          child: Container(
                        width: (MediaQuery.of(context).size.width) * 0.85,
                        // height: (MediaQuery.of(context).size.width) * 0.10,
                        color: AppColors.lightGrey,
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: (MediaQuery.of(context).size.width) * 0.02,
                            // ),
                            Padding(
                                padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.width) * 0.02,
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 5, child: Text("Photo")),
                                    Expanded(
                                        flex: 5,
                                        child: MaterialButton(
                                          height: 25,
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles(
                                              type: FileType.custom,
                                              allowedExtensions: ['jpg', 'png'],
                                            );

                                            if (result?.files[0].path != null) {
                                              print(
                                                  "result Path => ${result?.files[0].path}");
                                              setState(() {
                                                photoImagePath =
                                                    result!.files![0].path!;
                                              });
                                            }
                                          },
                                          color: (photoImagePath == "")
                                              ? AppColors.white
                                              : AppColors.green,
                                          child: const Text('Choose File'),
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width) *
                                                  0.01,
                                            ),
                                            child: (photoImagePath == "")
                                                ? const Text("No File Chosen")
                                                : Text(photoImagePath!
                                                    .split('/')
                                                    .last))),
                                  ],
                                )),
                            // Emirates ID Front
                            Padding(
                                padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.width) * 0.02,
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 5,
                                        child: Text("Emirates ID Front")),
                                    Expanded(
                                        flex: 5,
                                        child: MaterialButton(
                                          height: 25,
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles(
                                              type: FileType.custom,
                                              allowedExtensions: ['jpg', 'png'],
                                            );
                                            if (result?.files[0].path != null) {
                                              print(
                                                  "result Path => ${result?.files[0].path}");
                                              setState(() {
                                                frontIdImagePath =
                                                    result!.files![0].path!;
                                              });
                                            }
                                          },
                                          color: (frontIdImagePath == "")
                                              ? AppColors.white
                                              : AppColors.green,
                                          child: const Text('Choose File'),
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width) *
                                                  0.01,
                                            ),
                                            child: (frontIdImagePath == "")
                                                ? const Text("No File Chosen")
                                                : Text(frontIdImagePath!
                                                    .split('/')
                                                    .last))),
                                  ],
                                )),
                            //Emirates ID Back
                            Padding(
                                padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.width) * 0.02,
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 5,
                                        child: Text("Emirates ID Back")),
                                    Expanded(
                                        flex: 5,
                                        child: MaterialButton(
                                          height: 25,
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles(
                                              type: FileType.custom,
                                              allowedExtensions: ['jpg', 'png'],
                                            );

                                            if (result?.files[0].path != null) {
                                              print(
                                                  "result Path => ${result?.files[0].path}");
                                              setState(() {
                                                backIdImagePath =
                                                    result!.files![0].path!;
                                              });
                                            }
                                          },
                                          color: (backIdImagePath == "")
                                              ? AppColors.white
                                              : AppColors.green,
                                          child: const Text('Choose File'),
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width) *
                                                  0.01,
                                            ),
                                            child: (backIdImagePath == "")
                                                ? const Text("No File Chosen")
                                                : Text(backIdImagePath!
                                                    .split('/')
                                                    .last))),
                                  ],
                                )),
                          ],
                        ),
                      )))
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
                                  var uri = Uri.http(
                                      APIConstants.MAIN_BASE_URL,
                                      (currentUser.userType ==
                                              UserType.UserType_Coach)
                                          ? APIConstants.COACH_MEMBERSHIP
                                          : APIConstants.ATHLE_MEMBERSHIP);
                                  print(
                                      'YooooKK Add MemberShip KKooooY =>$uri ');
                                  var request =
                                      http.MultipartRequest('POST', uri);
                                  request.fields['user_id'] = await read(
                                      SharedPreferencesConstant.userId);
                                  request.fields["fullname"] =
                                      firstNameController.text;
                                  request.fields["last_name"] =
                                      lastnameController.text;
                                  request.fields["mobile"] =
                                      mobileController.text;
                                  request.fields["dob"] =
                                      currentDateTime.toString();
                                  request.fields["passport_number"] =
                                      passportController.text;
                                  request.fields["emirate"] = selectedLocation;
                                  request.fields["email"] =
                                      emailController.text;
                                  request.fields["nationality"] =
                                      nationalityController.text;
                                  request.fields["membership_type"] = "Athlete";
                                  request.fields["address"] =
                                      address1Controller.text;
                                  request.fields["address_two"] =
                                      address2Controller.text;
                                  request.fields["city"] = cityController.text;
                                  request.fields["state"] =
                                      stateController.text;
                                  request.fields["fee"] = await read(
                                      SharedPreferencesConstant.eventFee);
                                  request.fields["zip"] = zipController.text;
                                  if (currentUser.userType ==
                                      UserType.UserType_Coach) {
                                    request.fields["fee"] = feeController.text;
                                  }
                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'photo',
                                          File(photoImagePath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));

                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'id_front',
                                          File(frontIdImagePath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));

                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'id_back',
                                          File(backIdImagePath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));

                                  await imageUploadingAPICall(request)
                                      .then((str) async {
                                    if (str != "Fail") {
                                      List<MembershipImageUpload>
                                          membershipImageUpload =
                                          membershipImageUploadFromJson(str);
                                      await Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .setNavIndex(4);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebViewPage(
                                                  webUrl:
                                                      membershipImageUpload[0]
                                                          .paymentUrl!,
                                                )),
                                      );
                                    }
                                  });
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
