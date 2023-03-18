// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/landing_page.dart';
import 'package:ebbf/screen/splash/widget/liner_progress_indicator.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/durations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    apiServiceHelper(context, APIName.ALL).then((athleteListValue) async {
      scheduleMicrotask(() async {
        await Future.delayed(splashDuration);
        read(SharedPreferencesConstant.userId).then((id) async {
          if (id != null) {
            await apiServiceHelper(context, APIName.AFTERLOGING);
            if (await read(SharedPreferencesConstant.userType) ==
                UserType.UserType_Organized) {
              apiServiceHelper(context, APIName.ORGANIZERUNIQUE);
            }
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LandingPage()),
          );
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.splashBG1,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AppImages.homescreenimagebanner,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AppImages.splackscreenimage,
            width: (MediaQuery.of(context).size.width) * 0.80,
            fit: BoxFit.contain,
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.07,
              child: const LinerProgressIndicator()),
          Text(
            'Loading...',
            style: splashTextstyle(),
          )
        ],
      ),
    );
  }
}
