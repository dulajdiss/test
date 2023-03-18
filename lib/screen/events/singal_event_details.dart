import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:flutter/material.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:provider/provider.dart';

class SingleEventDetailsPage extends StatefulWidget {
  const SingleEventDetailsPage({super.key});

  @override
  State<SingleEventDetailsPage> createState() => _SingleEventDetailsPageState();
}

class _SingleEventDetailsPageState extends State<SingleEventDetailsPage> {
  // late EventsModel inDetails;
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      EventsModel singleEvents = showEBBF.singleEventDetails;
      title = singleEvents.title.toString();
      final Map<int, String> startymd = {
        for (int i = 0;
            i < singleEvents.startDate.toString().split('-').length;
            i++)
          i: singleEvents.startDate.toString().split('-')[i]
      };
      final Map<int, String> endymd = {
        for (int i = 0;
            i < singleEvents.endDate.toString().split('-').length;
            i++)
          i: singleEvents.endDate.toString().split('-')[i]
      };
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
                title: title,
                direction: "Home > Event > $title",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.02,
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) * 0.05,
                  bottom: (MediaQuery.of(context).size.width) * 0.02,
                ),
                child: Container(
                    width: (MediaQuery.of(context).size.width) * 0.2,
                    height: (MediaQuery.of(context).size.height) * 0.13,
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.height) * 0.02,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          startymd[2].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                (MediaQuery.of(context).size.width) * 0.054,
                          ),
                        ),
                        Text(
                          startymd[1].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontSize:
                                (MediaQuery.of(context).size.width) * 0.04,
                          ),
                        ),
                        Text(
                          startymd[0].toString(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontSize:
                                (MediaQuery.of(context).size.width) * 0.04,
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.05),
                child: AutoSizeText(
                  singleEvents.title.toString(),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: eventPageTopicTextstyle(),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.05),
                child: Text(
                  singleEvents.description.toString(),
                  style: eventPageDescriptionTextstyle(),
                ),
              ),
              // if (showEBBF.currentUser.userId != null)
              Center(
                child: BGGreenButton(
                  title: "REGISTER NOW",
                  onPressed: () async {
                    await read(SharedPreferencesConstant.userId).then((value) {
                      if (value != null) {
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(27);
                      } else {
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(17);
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.02,
              ),
              Container(
                color: AppColors.lightBlue,
                width: (MediaQuery.of(context).size.width),
                height: (MediaQuery.of(context).size.height) * 0.25,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const Icon(Icons.calendar_month),
                            Text(
                              "Date & Time : ${showEBBF.eventsListValue[0].startDate}",
                            ),
                            const Icon(Icons.map_sharp),
                             Text(
                              "Location : ${showEBBF.eventsListValue[0].location!}",
                            ),
                          ],
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          showEBBF.eventsListValue[0].pic!,
                          width: (MediaQuery.of(context).size.width) * 0.40,
                          height: (MediaQuery.of(context).size.height) * 0.30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.02,
              ),
            ])),
      );
    });
  }
}
