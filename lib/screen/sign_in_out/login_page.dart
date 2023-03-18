// ignore_for_file: use_build_context_synchronously

import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/user_login_service.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _isHidden = true, loginPress = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          // ignore: prefer_const_constructors
          const TitalBox(
            title: 'LOGIN',
            direction: "Home > Login",
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) * 0.04,
          ),
          Center(
            child: Text(
              "Login to your account",
              textAlign: TextAlign.center,
              style: loginTitleTextstyle(),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: loginDescriptionTextstyle(),
                children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: InkWell(
                          onTap: () {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setNavIndex(16);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const SignUpPage()),
                            // );
                          },
                          child: Text(
                            'Sign Up Free',
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
                Center(
                    child: SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.85,
                        // height: (MediaQuery.of(context).size.width) * 0.10,
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email here?',
                            labelText: 'Email Address',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter value";
                            } else {
                              bool emailValid = RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value!);
                              return emailValid
                                  ? null
                                  : "Invalid Email Address";
                            }
                          },
                        ))),
                Center(
                    child: SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.85,
                        // height: (MediaQuery.of(context).size.width) * 0.45,
                        child: TextFormField(
                          obscureText: _isHidden,
                          controller: passwordController,
                          decoration: InputDecoration(
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
                            return (value != null && value.contains('@'))
                                ? 'Do not use the @ char.'
                                : null;
                          },
                        ))),
              ],
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.all((MediaQuery.of(context).size.width) * 0.075),
              child: InkWell(
                child: Text(
                  'Forget Password?',
                  style: loginDescriptionLinkTextstyle(),
                ),
                onTap: () {},
              )),
          Center(
              child: loginPress
                  ? const BGGreenCircularProgress()
                  : BGGreenButton(
                      title: "LOGIN",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginPress = !loginPress;
                          });
                          await userLoginService(
                                  emailController.text, passwordController.text)
                              .then((userdata) async {
                            if (userdata.success == 1) {
                              print("Login Compleeted");
                              await Provider.of<EBBFNotifier>(context,
                                      listen: false)
                                  .setProfileData(userdata);
                              apiServiceHelper(context, APIName.AFTERLOGING)
                                  .then((hi) async {
                                emailController.text = "";
                                passwordController.text = "";
                                if (await read(
                                        SharedPreferencesConstant.userType) ==
                                    UserType.UserType_Organized) {
                                  apiServiceHelper(
                                          context, APIName.ORGANIZERUNIQUE)
                                      .then((hi) async {});
                                }
                                setState(() {
                                  loginPress = !loginPress;
                                });
                                await Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setNavIndex(4);
                                await Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setNavIndex(12);
                              });
                            } else {
                              setState(() {
                                loginPress = !loginPress;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    content: Text(userdata.message.toString())),
                              );
                            }
                          });
                        }
                      },
                    )),
        ]));
  }
}
