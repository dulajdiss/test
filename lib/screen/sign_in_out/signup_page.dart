// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/otp_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_filed.dart';
import 'package:ebbf/services/fetch/user_registration_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ebbf/services/fetch/otp_service.dart';
import 'dart:convert';
import 'package:ebbf/configs/url.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isHidden = true, _isHiddenConfirm = true;
  final _formKey = GlobalKey<FormState>();
  String currentUserType = "Select UserType";
  List<String>? userTypeDataList = [
    "Select UserType",
    "Gym Owner",
    'COACH',
    "ATHLETE",
    "Organizer"
  ];
  String selectedGender = "Select Gender";
  List<String>? genderDataList = ["Select Gender", "Male", "Female", "Other"];
  String selectedLocation = "Select Location";
  List<String> locationDataList = [];
  String firstName = "",
      middleName = "",
      lastname = "",
      email = "",
      mobile = "",
      password = '',
      confirmPassword = "",
      tradeName = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      locationDataList = [];
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
            const TitalBox(
              title: 'SIGNUP',
              direction: "Home > Sign Up",
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.04,
            ),
            Center(
              child: Text(
                "Create an Account",
                textAlign: TextAlign.center,
                style: loginTitleTextstyle(),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: loginDescriptionTextstyle(),
                  children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                            onTap: () {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setNavIndex(17);
                            },
                            child: Text(
                              'Login Now',
                              style: loginDescriptionLinkTextstyle(),
                            ))), // override default text styles with link-specific styles
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.04,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  RegisterDataFiled(
                    hintText: "Enter First Name",
                    labelText: "First Name",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter first name";
                      } else {}
                    },
                  ),
                  RegisterDataFiled(
                    hintText: "Enter Middle Name",
                    labelText: "Middle Name",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter middle name";
                      } else {
                        setState(() {
                          firstName = value;
                        });
                      }
                    },
                  ),
                  RegisterDataFiled(
                    hintText: "Enter Last Name",
                    labelText: "Last Name",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter last name";
                      } else {
                        setState(() {
                          lastname = value;
                        });
                      }
                    },
                  ),
                  RegisterDataDropDown(
                    currentSelectedValue: currentUserType,
                    onChange: (value) {
                      setState(() {
                        currentUserType = value;
                      });
                    },
                    dataList: userTypeDataList,
                  ),
                  RegisterDataFiled(
                    hintText: "Enter Email Address",
                    labelText: "Email",
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
                  RegisterDataFiled(
                    hintText: "+971-XXXXXXXX",
                    labelText: "Mobile",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "The Mobile Number field is required.";
                      } else {
                        if (value.length > 9) {
                          setState(() {
                            mobile = value;
                          });
                          return null;
                        } else {
                          return "Invalid Mobile Number";
                        }
                      }
                    },
                  ),
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.85,
                              // height: (MediaQuery.of(context).size.width) * 0.45,
                              child: TextFormField(
                                obscureText: _isHidden,
                                // controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29.0),
                                  ),
                                  fillColor: AppColors.lightGrey,
                                  filled: true,
                                  hintText: 'Enter your password here?',
                                  labelText: 'Password',
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isHidden = !_isHidden;
                                      });
                                    },
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  setState(() {
                                    password = value!;
                                  });
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              )))),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) * 0.85,
                    child: const Text(
                      "Minimum password length is 8 characters and it should be Alpha Numeric",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.85,
                              // height: (MediaQuery.of(context).size.width) * 0.45,
                              child: TextFormField(
                                obscureText: _isHiddenConfirm,
                                // controller: passwordController,
                                decoration: InputDecoration(
                                  fillColor: AppColors.lightGrey,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29.0),
                                  ),
                                  hintText:
                                      'Please reenter your password here?',
                                  labelText: 'Confirm Password',
                                  suffixIconColor: AppColors.green,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isHiddenConfirm = !_isHiddenConfirm;
                                      });
                                    },
                                    child: Icon(
                                      _isHiddenConfirm
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  setState(() {
                                    confirmPassword = value!;
                                  });
                                  return (value != password)
                                      ? 'The Password field does not match the Password Confirmation field.'
                                      : null;
                                },
                              )))),
                  if (currentUserType == "Gym Owner")
                    RegisterDataFiled(
                      hintText: "Enter Gym Name",
                      labelText: "Gym Name",
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter value";
                        } else {
                          setState(() {
                            tradeName = value!;
                          });
                          return null;
                        }
                      },
                    ),
                  if (currentUserType == "Organizer")
                    RegisterDataFiled(
                      hintText: "Enter Organizer Name",
                      labelText: "Organizer Name",
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter value";
                        } else {
                          setState(() {
                            tradeName = value!;
                          });
                          return null;
                        }
                      },
                    ),
                  RegisterDataDropDown(
                    currentSelectedValue: selectedLocation,
                    onChange: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                    dataList: locationDataList,
                  ),
                  RegisterDataDropDown(
                    currentSelectedValue: selectedGender,
                    onChange: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    dataList: genderDataList,
                  ),
                ],
              ),
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BGGreenButton(
                      title: "SIGNUP",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Map<String, String> registerMap = {};
                          registerMap["fullname"] = firstName;
                          registerMap["mid_name"] = middleName;
                          registerMap["last_name"] = lastname;
                          registerMap["email"] = email;
                          registerMap["mobile"] = mobile;
                          registerMap["password"] = password;
                          if (currentUserType == "Gym Owner") {
                            registerMap["user_type"] =
                                UserType.UserType_Gym_Owner;
                            registerMap["trade_name"] = tradeName;
                          } else if (currentUserType == "COACH") {
                            registerMap["user_type"] = UserType.UserType_Coach;
                            registerMap["trade_name"] = tradeName;
                          } else if (currentUserType == "ATHLETE") {
                            registerMap["user_type"] =
                                UserType.UserType_Athlete;
                            registerMap["trade_name"] = tradeName;
                          } else if (currentUserType == "Organizer") {
                            registerMap["user_type"] =
                                UserType.UserType_Organized;
                            registerMap["trade_name"] = tradeName;
                          }
                          String locationId = '';
                          for (int i = 0;
                              i < showEBBF.locationList.length;
                              i++) {
                            if (selectedLocation ==
                                showEBBF.locationList[i].locationTitle) {
                              locationId = showEBBF.locationList[i].locationId!;
                            }
                          }
                          registerMap["location"] = selectedLocation;
                          registerMap["et_id"] = "1";
                          registerMap["gender"] = selectedGender;
                          registerMap["location_id"] = locationId;
                          userRegisterService(registerMap)
                              .then((registerValue) async {
                            if (registerValue.success.toString() == '1') {
                              await otpVerify(registerValue.otpId!,
                                      APIConstants.OTP_SMS_SENDER_URL)
                                  .then((str) {
                                OTPModel otpData =
                                    OTPModel.fromJson(json.decode(str));
                                if (otpData.success.toString() != '0') {
                                  print('sms send success');
                                  otpVerify(registerValue.otpId!,
                                          APIConstants.OTP_DETAILS_URL)
                                      .then((strDetails) async {
                                    List<OTPGenerator> list =
                                        otpGeneratorFromJson(strDetails);
                                    if (list[0].success.toString() != '0') {
                                      print('otp success => ${list[0].otp}');
                                      await Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .setOTPnumber(list[0].otp!);
                                      await Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .setNavIndex(25);
                                    }
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(otpData.message.toString())),
                                  );
                                  print('sms send error');
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text(registerValue.message.toString())),
                              );
                            }
                          });
                        }
                      },
                    ))),
          ]));
    });
  }
}
