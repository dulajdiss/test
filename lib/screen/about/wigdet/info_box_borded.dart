import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/view_aal_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoEventBoxBorded extends StatelessWidget {
  const InfoEventBoxBorded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<EventsModel> eventList = showEBBF.eventsListValue;
      int index = showEBBF.aboutUsLatestEvent;
      return Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.green,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          padding:
              EdgeInsets.only(left: (MediaQuery.of(context).size.width) * 0.05),
          width: (MediaQuery.of(context).size.width) * 0.98,
          height: (MediaQuery.of(context).size.height) * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'UPCOMING EVENTS',
                        style: infoBoxTitleTextstyle(),
                      ),
                    ),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.25,
                        child: FittedBox(child: ViewAllAndNextBtn(
                          onPressViewAll: () {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setNavIndex(13);
                          },
                        ))),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      eventList[index].pic.toString(),
                      width: (MediaQuery.of(context).size.width) * 0.40,
                      height: (MediaQuery.of(context).size.height) * 0.20,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            eventList[index].title.toString(),
                            maxLines: 5,
                            style: infoBoxTopicTextstyle(),
                          ),
                          BGGreenButton(
                            title: 'Read More',
                            onPressed: () {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setNavIndex(20);
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setEventDetails(eventList[index]);
                            },
                          )
                        ],
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.09,
                        height: (MediaQuery.of(context).size.width) * 0.09,
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {
                              if (eventList.length - 1 == index) {
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setAboutUsLatestEvent(0);
                              } else {
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setAboutUsLatestEvent(index + 1);
                              }
                            },
                            color: AppColors.green,
                            textColor: Colors.white,
                            // ignore: sort_child_properties_last
                            child: const Icon(
                              Icons.navigate_next,
                            ),
                            // shape: const CircleBorder(),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      );
    });
  }
}
