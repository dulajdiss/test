import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/services/fetch/user_change_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool changePWPress = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            // ignore: prefer_const_constructors
            TitalBoxWithBackButton(
              title: 'DASHBOARD',
              direction: "Home > Dashboard > Change Password",
              onPress: () {
                Provider.of<EBBFNotifier>(context, listen: false)
                    .setNavIndex(showEBBF.previousSelectedIndex);
              },
            ),

            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.04,
            ),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.80,
                      child: Text("Change Password *",
                          style: profileUserNameTextstyle())),
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
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              } else {
                                if (value.length < 4) {
                                  return "A password is short and weak";
                                } else {
                                  return null;
                                }
                              }
                            },
                          ))),
                  SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.80,
                      child: Text(
                        "Confirm Password *",
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
                        child: TextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                            hintText: 'Re-enter your password ',
                            // labelText: 'Re-enter your password ',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter value";
                            } else {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return "Enter password is incorrect";
                              } else {
                                return null;
                              }
                            }
                          },
                        )),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.04,
                  ),
                  changePWPress
                      ? const BGGreenCircularProgress()
                      : BGGreenButton(
                          title: "SUBMIT",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                changePWPress = true;
                              });
                              await fetchChangePassword(passwordController.text)
                                  .then((value) {
                                print('Change Password API called');
                                setState(() {
                                  changePWPress = true;
                                });
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setNavIndex(4);
                              });
                            }
                          },
                        )
                ]))
          ])));
    });
  }
}
