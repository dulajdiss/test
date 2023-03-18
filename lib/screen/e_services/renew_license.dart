// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/url.dart';
import 'package:ebbf/models/license_type_module.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/e_services/widget/choose_file.dart';
import 'package:ebbf/screen/dashbord/widget/check_box_with_text.dart';
import 'package:ebbf/screen/dashbord/widget/dashboard_register_data_filed.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/services/fetch/fetch_membership.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ReNewLicense extends StatefulWidget {
  const ReNewLicense({Key? key}) : super(key: key);

  @override
  State<ReNewLicense> createState() => _ReNewLicenseState();
}

class _ReNewLicenseState extends State<ReNewLicense> {
  bool _isSelect = false,
      chooseType = false,
      secondOwner = false,
      thirdOwner = false;
  int _chooseId = 0;
  final _formKey = GlobalKey<FormState>();
  String selectedNationality = "Select Nationality";
  List<String>? nationalityDataList = [
    "Select Nationality",
  ];
  String selectedLocation = "Select Location";
  List<String> locationDataList = [];
  DateTime currentDateTime = DateTime.now();
  String typeOfTransaction = "",
      tradeName = "",
      tradeLicenseId = "",
      tradeId = "",
      issueDate = "",
      email = '',
      expiryDate = "",
      activity = "",
      sponsor = "",
      phoneNumber = "",
      address = "",
      emirates = '', //location_id
      bAddress = "",
      bAddress2 = "",
      city = '',
      zip = "",
      addressTwo = "",
      state = '',
      owners = "",
      tradeNamePicPath = "",
      initialApprovalPath = '',
      idFrontPath = "",
      idBackPath = "",
      sponsorIdFrontPath = "",
      sponsorIdBackPath = "",
      idFrontOnePath = "",
      idBackOnePath = "",
      idFrontTwoPath = "",
      idBackTwoPath = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      UserModel currentUser = showEBBF.currentUser;
      List<LicenseTypeModule> ltmList = showEBBF.licenseTypeList;
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
            TitalBoxWithBackButton(
              title: 'ISSUE/RENEW LICENSE',
              direction: "Home > Issue/renew license",
              onPress: () {
                Provider.of<EBBFNotifier>(context, listen: false)
                    .setNavIndex(showEBBF.previousSelectedIndex);
              },
            ),

            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.04,
            ),

            Center(
              child: Container(
                color: AppColors.green,
                height: (MediaQuery.of(context).size.width) * 0.12,
                width: (MediaQuery.of(context).size.width) * 0.90,
                alignment: const Alignment(-1, 0),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.05),
                    child: const Text(
                      'Choose type transaction',
                      style: TextStyle(color: AppColors.white),
                    )),
              ),
            ),

            Center(
                child: Container(
                    color: AppColors.black,
                    width: (MediaQuery.of(context).size.width) * 0.90,
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      for (int i = 0; i < ltmList.length; i++)
                        CheckBoxWithText(
                          title: ltmList[i].title,
                          value: _chooseId == i,
                          onChnage: (bool? value) {
                            setState(() {
                              _chooseId = i;
                              typeOfTransaction = ltmList[i].title!;
                            });
                          },
                        ),
                    ]))),

            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.04,
            ),

            Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                    labelText: "Trade license no (Initial approval number)*",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Trade license no";
                      } else {
                        setState(() {
                          tradeLicenseId = value;
                        });
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Trade Name *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter trade name";
                      } else {
                        setState(() {
                          tradeName = value;
                        });
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    // hintText: "Contact Number *",
                    labelText: "Expire Date ",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter expire data";
                      } else {
                        setState(() {
                          expiryDate = value;
                        });
                      }
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.11,
                      ),
                      child: const Text("Date Of Issue *")),
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
                                      ? 'Please values.'
                                      : null;
                                },
                              )))),
                  DashBoardRegisterDataFiled(
                    labelText: "Address *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Address field is required.";
                      } else {
                        setState(() {
                          address = value;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "The Activities *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The field is required.";
                      } else {
                        setState(() {
                          activity = value;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Billing Address *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        setState(() {
                          bAddress = value!;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Phone Number *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The type field is required.";
                      } else {
                        setState(() {
                          phoneNumber = value;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Billing Address 2 *",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        setState(() {
                          bAddress2 = value!;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "Email Id*",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Email address field is required.";
                      } else {
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value!);
                        setState(() {
                          email = value;
                        });
                        return emailValid ? null : "Invalid Email Address";
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "City",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        setState(() {
                          city = value!;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "ZIP",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        setState(() {
                          zip = value!;
                        });
                        return null;
                      }
                    },
                  ),
                  DashBoardRegisterDataFiled(
                    labelText: "State",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        setState(() {
                          state = value!;
                        });
                        return null;
                      }
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.11,
                      ),
                      child: const Text("Owners *")),
                  Padding(
                      padding: EdgeInsets.all(
                        (MediaQuery.of(context).size.width) * 0.01,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.69,
                                // height: (MediaQuery.of(context).size.width) * 0.10,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    fillColor: AppColors.lightGrey,
                                    filled: true,
                                    hintText: "",
                                  ),
                                  onSaved: (String? value) {
                                    setState(() {
                                      owners = value!;
                                    });
                                  },
                                )),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.02,
                            ),
                            Container(
                                color: AppColors.green,
                                width:
                                    (MediaQuery.of(context).size.width) * 0.14,
                                height:
                                    (MediaQuery.of(context).size.width) * 0.14,
                                child: IconButton(
                                  onPressed: () {
                                    if (!secondOwner) {
                                      setState(() {
                                        secondOwner = true;
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                  ),
                                ))
                          ])),
                  if (secondOwner)
                    Padding(
                        padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width) * 0.01,
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: (MediaQuery.of(context).size.width) *
                                      0.53,
                                  // height: (MediaQuery.of(context).size.width) * 0.10,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      fillColor: AppColors.lightGrey,
                                      filled: true,
                                      hintText: "",
                                    ),
                                    onSaved: (String? value) {
                                      setState(() {
                                        owners = "$owners,${value!}";
                                      });
                                    },
                                  )),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.02,
                              ),
                              Container(
                                  color: AppColors.green,
                                  width: (MediaQuery.of(context).size.width) *
                                      0.14,
                                  height: (MediaQuery.of(context).size.width) *
                                      0.14,
                                  child: IconButton(
                                    onPressed: () {
                                      if (!thirdOwner) {
                                        setState(() {
                                          thirdOwner = true;
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: AppColors.white,
                                    ),
                                  )),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.02,
                              ),
                              Container(
                                  color: AppColors.green,
                                  width: (MediaQuery.of(context).size.width) *
                                      0.14,
                                  height: (MediaQuery.of(context).size.width) *
                                      0.14,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        secondOwner = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: AppColors.white,
                                    ),
                                  ))
                            ])),
                  if (thirdOwner)
                    Padding(
                        padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width) * 0.01,
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: (MediaQuery.of(context).size.width) *
                                      0.69,
                                  // height: (MediaQuery.of(context).size.width) * 0.10,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      fillColor: AppColors.lightGrey,
                                      filled: true,
                                      hintText: "",
                                    ),
                                    onSaved: (String? value) {
                                      setState(() {
                                        owners = "$owners,${value!}";
                                      });
                                    },
                                  )),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.02,
                              ),
                              Container(
                                  color: AppColors.green,
                                  width: (MediaQuery.of(context).size.width) *
                                      0.14,
                                  height: (MediaQuery.of(context).size.width) *
                                      0.14,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        thirdOwner = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: AppColors.white,
                                    ),
                                  ))
                            ])),
                  Padding(
                      padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.width) * 0.02,
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
                            ChooseImageFile(
                              title: "Trade Name",
                              boxColor: tradeNamePicPath == ""
                                  ? AppColors.white
                                  : AppColors.green,
                              boxMessage: tradeNamePicPath == ""
                                  ? "No File Selected"
                                  : tradeNamePicPath!.split('/').last,
                              onSelect: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png'],
                                );

                                if (result?.files[0].path != null) {
                                  print(
                                      "result Path => ${result?.files[0].path}");
                                  setState(() {
                                    tradeNamePicPath = result!.files![0].path!;
                                  });
                                }
                              },
                            ),
                            ChooseImageFile(
                              title: "Initial Approval",
                              boxColor: initialApprovalPath == ""
                                  ? AppColors.white
                                  : AppColors.green,
                              boxMessage: initialApprovalPath == ""
                                  ? "No File Selected"
                                  : initialApprovalPath!.split('/').last,
                              onSelect: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png'],
                                );

                                if (result?.files[0].path != null) {
                                  print(
                                      "result Path => ${result?.files[0].path}");
                                  setState(() {
                                    initialApprovalPath =
                                        result!.files![0].path!;
                                  });
                                }
                              },
                            ),
                            ChooseImageFile(
                              title: "Owner 1 Emirates ID Font",
                              boxColor: idFrontPath == ""
                                  ? AppColors.white
                                  : AppColors.green,
                              boxMessage: idFrontPath == ""
                                  ? "No File Selected"
                                  : idFrontPath!.split('/').last,
                              onSelect: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png'],
                                );

                                if (result?.files[0].path != null) {
                                  print(
                                      "result Path => ${result?.files[0].path}");
                                  setState(() {
                                    idFrontPath = result!.files![0].path!;
                                  });
                                }
                              },
                            ),
                            ChooseImageFile(
                              title: "Owner 1 Emirates ID Back",
                              boxColor: idBackPath == ""
                                  ? AppColors.white
                                  : AppColors.green,
                              boxMessage: idBackPath == ""
                                  ? "No File Selected"
                                  : idBackPath!.split('/').last,
                              onSelect: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png'],
                                );

                                if (result?.files[0].path != null) {
                                  print(
                                      "result Path => ${result?.files[0].path}");
                                  setState(() {
                                    idBackPath = result!.files![0].path!;
                                  });
                                }
                              },
                            ),
                            if (secondOwner)
                              ChooseImageFile(
                                title: "Owner 2 Emirates ID Font",
                                boxColor: idFrontOnePath == ""
                                    ? AppColors.white
                                    : AppColors.green,
                                boxMessage: idFrontOnePath == ""
                                    ? "No File Selected"
                                    : idFrontOnePath!.split('/').last,
                                onSelect: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png'],
                                  );

                                  if (result?.files[0].path != null) {
                                    print(
                                        "result Path => ${result?.files[0].path}");
                                    setState(() {
                                      idFrontOnePath = result!.files![0].path!;
                                    });
                                  }
                                },
                              ),
                            if (secondOwner)
                              ChooseImageFile(
                                title: "Owner 2 Emirates ID Back",
                                boxColor: idBackOnePath == ""
                                    ? AppColors.white
                                    : AppColors.green,
                                boxMessage: idBackOnePath == ""
                                    ? "No File Selected"
                                    : idBackOnePath!.split('/').last,
                                onSelect: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'pdf', 'png'],
                                  );

                                  if (result?.files[0].path != null) {
                                    print(
                                        "result Path => ${result?.files[0].path}");
                                    setState(() {
                                      idBackOnePath = result!.files![0].path!;
                                    });
                                  }
                                },
                              ),
                            if (thirdOwner)
                              ChooseImageFile(
                                title: "Owner 3 Emirates ID Font",
                                boxColor: idFrontTwoPath == ""
                                    ? AppColors.white
                                    : AppColors.green,
                                boxMessage: idFrontTwoPath == ""
                                    ? "No File Selected"
                                    : idFrontTwoPath!.split('/').last,
                                onSelect: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png'],
                                  );

                                  if (result?.files[0].path != null) {
                                    print(
                                        "result Path => ${result?.files[0].path}");
                                    setState(() {
                                      idFrontTwoPath = result!.files![0].path!;
                                    });
                                  }
                                },
                              ),
                            if (thirdOwner)
                              ChooseImageFile(
                                title: "Owner 3 Emirates ID Back",
                                boxColor: idBackTwoPath == ""
                                    ? AppColors.white
                                    : AppColors.green,
                                boxMessage: idBackTwoPath == ""
                                    ? "No File Selected"
                                    : idBackTwoPath!.split('/').last,
                                onSelect: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png'],
                                  );

                                  if (result?.files[0].path != null) {
                                    print(
                                        "result Path => ${result?.files[0].path}");
                                    setState(() {
                                      idBackTwoPath = result!.files![0].path!;
                                    });
                                  }
                                },
                              ),
                            ChooseImageFile(
                              title: "Sponsor Emirates ID Font",
                              boxColor: sponsorIdFrontPath == ""
                                  ? AppColors.white
                                  : AppColors.green,
                              boxMessage: sponsorIdFrontPath == ""
                                  ? "No File Selected"
                                  : sponsorIdFrontPath!.split('/').last,
                              onSelect: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png'],
                                );

                                if (result?.files[0].path != null) {
                                  print(
                                      "result Path => ${result?.files[0].path}");
                                  setState(() {
                                    sponsorIdFrontPath =
                                        result!.files![0].path!;
                                  });
                                }
                              },
                            ),
                            ChooseImageFile(
                              title: "Sponsor Emirates ID Back",
                              boxColor: sponsorIdBackPath == ""
                                  ? AppColors.white
                                  : AppColors.green,
                              boxMessage: sponsorIdBackPath == ""
                                  ? "No File Selected"
                                  : sponsorIdBackPath!.split('/').last,
                              onSelect: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'pdf', 'png'],
                                );
                                if (result?.files[0].path != null) {
                                  print(
                                      "result Path => ${result?.files[0].path}");
                                  setState(() {
                                    sponsorIdBackPath = result!.files![0].path!;
                                  });
                                }
                              },
                            ),
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
                                  var uri = Uri.http(APIConstants.MAIN_BASE_URL,
                                      APIConstants.RE_NEW_LICENSE);
                                  var request =
                                      http.MultipartRequest('POST', uri);
                                  // request.fields['user_id'] = await read(
                                  //     SharedPreferencesConstant.userId);
                                  request.fields["trade_name"] = tradeName;
                                  request.fields["l_id"] = showEBBF
                                      .licenseTypeList[_chooseId].lId
                                      .toString();
                                  request.fields["issue_date"] = issueDate;
                                  request.fields["email"] = email;
                                  request.fields["expiry_date"] = expiryDate;
                                  request.fields["activity"] = activity;
                                  request.fields["sponsor"] = sponsor;
                                  request.fields["phone_number"] = phoneNumber;
                                  request.fields["address"] = address;

                                  for (int i = 0;
                                      i < showEBBF.locationList.length;
                                      i++) {
                                    if (selectedLocation ==
                                        showEBBF
                                            .locationList[i].locationTitle) {
                                      emirates =
                                          showEBBF.locationList[i].locationId!;
                                    }
                                  }
                                  request.fields["emirate"] = emirates;
                                  request.fields["fee"] = showEBBF
                                      .licenseTypeList[_chooseId].amount
                                      .toString();
                                  request.fields["b_address"] = bAddress;
                                  request.fields["city"] = city;
                                  request.fields["zip"] = zip;
                                  request.fields["address_two"] = addressTwo;
                                  request.fields["state"] = state;
                                  request.fields["owners"] = owners;

                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'trade_name_pic',
                                          File(tradeNamePicPath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));

                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'intial_approval',
                                          File(initialApprovalPath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));

                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'id_front',
                                          File(idFrontPath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));
                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'id_back',
                                          File(idBackPath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));

                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'sid_front',
                                          File(sponsorIdFrontPath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));
                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'sid_back',
                                          File(sponsorIdBackPath.toString())
                                              .path
                                              .toString(),
                                          contentType:
                                              MediaType('image', 'png')));
                                  if (secondOwner) {
                                    request.files.add(
                                        await http.MultipartFile.fromPath(
                                            'id_front_one',
                                            File(idFrontOnePath.toString())
                                                .path
                                                .toString(),
                                            contentType:
                                                MediaType('image', 'png')));
                                    request.files.add(
                                        await http.MultipartFile.fromPath(
                                            'id_back_one',
                                            File(idBackOnePath.toString())
                                                .path
                                                .toString(),
                                            contentType:
                                                MediaType('image', 'png')));
                                  }
                                  if (thirdOwner) {
                                    request.files.add(
                                        await http.MultipartFile.fromPath(
                                            'id_front_two',
                                            File(idFrontTwoPath.toString())
                                                .path
                                                .toString(),
                                            contentType:
                                                MediaType('image', 'png')));

                                    request.files.add(
                                        await http.MultipartFile.fromPath(
                                            'id_back_two',
                                            File(idBackTwoPath.toString())
                                                .path
                                                .toString(),
                                            contentType:
                                                MediaType('image', 'png')));
                                  }
                                  print(
                                      'YooooKK Renew License KKooooY =>$uri ');
                                  await Provider.of<EBBFNotifier>(context,
                                          listen: false)
                                      .setNavIndex(4);
                                  await imageUploadingAPICall(request);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Please fill in this field")),
                                  );
                                }
                              },
                            ))))),
          ]));
    });
  }
}
