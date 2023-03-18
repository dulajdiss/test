import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/dashbord/widget/event_dashboard_card.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardEvents extends StatefulWidget {
  const DashboardEvents({Key? key}) : super(key: key);

  @override
  State<DashboardEvents> createState() => _DashboardEventsState();
}

class _DashboardEventsState extends State<DashboardEvents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<EventsModel> eventsList = showEBBF.eventsListValue;
      return Scaffold(
          body: RefreshIndicator(
              onRefresh: () async =>
                  await apiServiceHelper(context, APIName.EVENTS),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    // ignore: prefer_const_constructors
                    Stack(children: [
                      TitalBoxWithBackButton(
                        title: 'DASHBOARD',
                        direction: "Home > Dashboard > Events",
                        onPress: () {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .setNavIndex(4);
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
                    for (int i = 0; i < eventsList.length; i++)
                      DashboardEventsCard(
                        eventDetails: eventsList[i],
                        onPress: () {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .setEventDetails(eventsList[i]);
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .setNavIndex(27);
                        },
                      )
                  ]))));
    });
  }
}
