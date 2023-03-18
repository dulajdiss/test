import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/view_aal_next_btn.dart';
import 'package:ebbf/screen/events/widget/event_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EventWidget extends StatefulWidget {
  final eventController;
  const EventWidget({super.key, this.eventController});

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  List<Widget> _EventBodyList = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<EventsModel> eventsList = showEBBF.eventsListValue;
      _EventBodyList = [];
      for (int i = 0; i < eventsList.length; i++) {
        _EventBodyList.add(
          EventBody(
              eventDetails: eventsList[i],
              onPressReadMore: () {
                Provider.of<EBBFNotifier>(context, listen: false)
                    .setNavIndex(20);
                Provider.of<EBBFNotifier>(context, listen: false)
                    .setEventDetails(eventsList[i]);
              }),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width) * 0.1,
              bottom: (MediaQuery.of(context).size.width) * 0.02,
              top: (MediaQuery.of(context).size.width) * 0.05,
            ),
            // right: (MediaQuery.of(context).size.width) * 0.05),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Event',
                    style: newsTextstyle(),
                  ),
                  ViewAllAndNextBtn(
                    onPressViewAll: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(13);
                    },
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: SizedBox(
              width: (MediaQuery.of(context).size.width),
              height: (MediaQuery.of(context).size.height) * 0.7,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: widget.eventController,
                onPageChanged: (num) {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setHomeEventMovingButton(num);
                },
                children: _EventBodyList,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: widget.eventController,
                count: _EventBodyList.length,
                // ignore: prefer_const_constructors
                effect: WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thin,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
