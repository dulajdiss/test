// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:flutter/services.dart';
import 'package:ebbf/screen/splash/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (BuildContext context) {
                return EBBFNotifier();
              }),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  canvasColor: AppColors.white,
                  unselectedWidgetColor: AppColors.green,
                  appBarTheme: const AppBarTheme(
                    color: AppColors.white,
                  )),
              home: const SplashPage(),
            ),
          );
        });
  }
}
