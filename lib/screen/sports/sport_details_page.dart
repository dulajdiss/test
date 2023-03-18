import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SportDetailsPage extends StatefulWidget {
  const SportDetailsPage({super.key});

  @override
  State<SportDetailsPage> createState() => _SportDetailsPageState();
}

class _SportDetailsPageState extends State<SportDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      SportsModels sportInfo = showEBBF.singleSportDetails;
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_constructors
                // ignore: prefer_const_literals_to_create_immutables
                children: [
              // ignore: prefer_const_constructors
              TitalBox(
                title: 'SPORTS',
                direction: "Home > About EBBF > Sports > ${sportInfo.title}",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    sportInfo.title.toString(),
                    textAlign: TextAlign.center,
                    style: visionMissionSportTextstyle(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  sportInfo.description.toString(),
                  textAlign: TextAlign.start,
                  style: presidentMsgBoadyTextstyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColors.lightBlue,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Arm Wrestling',
                            textAlign: TextAlign.center,
                            style: visionMissionSportTextstyle(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' ViewPostIme pointer ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme point ViewPostIme pointer  ViewPostIme pointer  ViewPostIme pointer v  ViewPostIme pointer v  ViewPostIme pointer  ViewPostIme pointer  ViewPostIme pointer  ViewPostIme pointer',
                          textAlign: TextAlign.start,
                          style: presidentMsgBoadyTextstyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: BGGreenButton(
                  title: 'Rules',
                  onPressed: () {},
                ),
              ))
            ])), // ignore: unnecessary_new
      );
    });
  }
}
