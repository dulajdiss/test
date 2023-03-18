import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPVerifyPage extends StatefulWidget {
  const OTPVerifyPage({Key? key}) : super(key: key);

  @override
  State<OTPVerifyPage> createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  TextEditingController controler = TextEditingController();
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      String selectOTPIndex = showEBBF.otpNumber;
      return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            // ignore: prefer_const_constructors
            const TitalBox(
              title: 'OTP VERIFY',
              direction: "Home > Sign Up > OTP Verify",
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.02,
            ),
            Image(
              image: AppImages.otpPin,
              height: (MediaQuery.of(context).size.height) * 0.35,
            ),
            Text(
              "Please enter the OTP send to your mobile and click verify button",
              style: otpDescription(),
              textAlign: TextAlign.center,
            ),
            if (message != "")
              Text(
                message,
                style: otpErrorDescription(),
                textAlign: TextAlign.center,
              ),
            Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: TextField(
                  controller: controler,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'OTP', hintText: 'XXXX'),
                )),
            BGGreenButton(
              title: "VERIFY",
              onPressed: () {
                if (selectOTPIndex == controler.text) {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(17);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text("Invalid OTP Code")),
                  );
                }
              },
            )
          ]));
    });
  }
}
