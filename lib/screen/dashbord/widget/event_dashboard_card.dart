import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/screen/events/widget/event_body_details_part.dart';
import 'package:flutter/material.dart';

class DashboardEventsCard extends StatelessWidget {
  final eventDetails;
  final onPress;
  const DashboardEventsCard({Key? key, this.eventDetails, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(
          (MediaQuery.of(context).size.height) * 0.01,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.network(
                eventDetails.pic,
                width: (MediaQuery.of(context).size.width) * 0.47,
                height: (MediaQuery.of(context).size.height) * 0.19,
                fit: BoxFit.cover,
              ),

              // ),
            ),
            Container(
                width: (MediaQuery.of(context).size.width) * 0.47,
                height: (MediaQuery.of(context).size.height) * 0.19,
                color: AppColors.moreLightGrey,
                child: EventBodyDetailsePart(
                  eventDetails: eventDetails,
                  onPressReadMore: onPress,
                )),
          ],
        ));
  }
}
