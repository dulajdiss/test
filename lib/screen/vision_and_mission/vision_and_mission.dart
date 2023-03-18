import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/sponsors_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/sponsors_card.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/vision_and_mission/widget/sport_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VisionAndMission extends StatefulWidget {
  const VisionAndMission({super.key});

  @override
  State<VisionAndMission> createState() => _VisionAndMissionState();
}

class _VisionAndMissionState extends State<VisionAndMission> {
  PageController controller = PageController();
  PageController sportController = PageController();
  List<Widget> _list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      int visionMissionSportEventMovingIndex =
          showEBBF.visionMissionSportEventMovingIndex;
      List<SponsorsModels> entries = showEBBF.sponsorsListValue;
      _list = [];
      for (int i = 0; i < showEBBF.sportsListValue.length; i++) {
        _list.add(Center(
            child: SportBody(
          sportData: showEBBF.sportsListValue[i],
        )));
      }
      return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_constructors
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              const TitalBox(
                title: 'OUR VISION AND MISSION',
                direction: "Home > About EBBF > Our Vision and Mission",
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.04),
                  child: Text(
                    'VISION',
                    style: visionMissionSportTextstyle(),
                  ),
                ),
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width) * 0.05,
                    right: (MediaQuery.of(context).size.width) * 0.05),
                color: AppColors.lightGrey,
                width: (MediaQuery.of(context).size.width) * 0.94,
                height: (MediaQuery.of(context).size.height) * 0.13,
                child: Center(
                    child: Text(
                  """To foster the Bodybuilding & Fitness sector in the UAE par excellence and global standards by presiding as the bonafide source of information, administration and regulation for affiliated entities and events.""",
                  textAlign: TextAlign.center,
                  style: presidentMsgBoadyTextstyle(),
                )),
              )),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.04),
                  child: Text(
                    'MISSION',
                    style: visionMissionSportTextstyle(),
                  ),
                ),
              ),
              Center(
                  child: Container(
                color: AppColors.lightGrey,
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width) * 0.05,
                    right: (MediaQuery.of(context).size.width) * 0.05),
                width: (MediaQuery.of(context).size.width) * 0.90,
                height: (MediaQuery.of(context).size.height) * 0.45,
                child: Center(
                    child: Text(
                  """
1. Promote, protect and empower member athletes and coaches to enable the attainment of their goals and objectives.\n
2. Propagate authentic information and advanced knowledge surrounding the Bodybuilding & Fitness industry.\n
3. Inculcate ethical and clean bodybuilding codes and practices.\n
4. Grow to emerge as the most reliable and preferred entity responsible for organizing international bodybuilding and fitness sports & events.\n
5. Contribute to strengthening the purpose of global bodybuilding federations in amplifying the foothold of bodybuilding and fitness sports worldwide.""",
                  textAlign: TextAlign.start,
                  style: presidentMsgBoadyTextstyle(),
                )),
              )),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width) * 0.04),
                  child: Text(
                    'SPORTS',
                    style: visionMissionSportTextstyle(),
                  ),
                ),
              ),
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: SizedBox(
                      width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.height) * 0.53,
                      child: PageView(
                        children: _list,
                        scrollDirection: Axis.horizontal,
                        controller: sportController,
                        onPageChanged: (num) {
                          setState(() {
                            // _curr = num;
                          });
                        },
                      ) //SamplePage(),
                      ),
                ),
                Positioned(
                  top: (MediaQuery.of(context).size.height) * 0.23,
                  bottom: (MediaQuery.of(context).size.height) * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                        color: AppColors.green,
                        child: IconButton(
                          icon: const Icon(Icons.navigate_before),
                          onPressed: () {
                            if (visionMissionSportEventMovingIndex > 0) {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .seVisionMissionSportEventMovingButton(
                                      visionMissionSportEventMovingIndex - 1);
                            }
                            // use this to animate to the page
                            sportController.animateToPage(
                              visionMissionSportEventMovingIndex - 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                        )),
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width) * 0.86,
                  top: (MediaQuery.of(context).size.height) * 0.23,
                  bottom: (MediaQuery.of(context).size.height) * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                        color: AppColors.green,
                        child: IconButton(
                          icon: const Icon(Icons.navigate_next),
                          onPressed: () {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .seVisionMissionSportEventMovingButton(
                                    visionMissionSportEventMovingIndex + 1);
                            // use this to animate to the page
                            sportController.animateToPage(
                              visionMissionSportEventMovingIndex + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                        )),
                  ),
                ),
              ]),

              Center(
                child: SmoothPageIndicator(
                  controller: sportController,
                  count: _list.length,
                  // ignore: prefer_const_constructors
                  effect: WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thin,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'SPONSORS',
                    style: visionMissionSportTextstyle(),
                  ),
                ),
              ),
              if (entries.isNotEmpty)
                SponsorsCard(
                  controler: controller,
                  entries: entries,
                ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.03,
              )
            ]),
      );
    });
  }
}
