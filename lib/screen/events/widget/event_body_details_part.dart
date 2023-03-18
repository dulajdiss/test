import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:flutter/material.dart';

class EventBodyDetailsePart extends StatelessWidget {
  final eventDetails;
  final onPressReadMore;
  const EventBodyDetailsePart(
      {Key? key, this.eventDetails, this.onPressReadMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<int, String> startymd = {
      for (int i = 0;
          i < eventDetails.startDate.toString().split('-').length;
          i++)
        i: eventDetails.startDate.toString().split('-')[i]
    };
    final Map<int, String> endymd = {
      for (int i = 0;
          i < eventDetails.endDate.toString().split('-').length;
          i++)
        i: eventDetails.endDate.toString().split('-')[i]
    };
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(2),
      ),
      width: (MediaQuery.of(context).size.width) * 0.95,
      height: (MediaQuery.of(context).size.height) * 0.38,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "${startymd[2]}",
                  style:const TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                AutoSizeText(
                  "${startymd[1]}",
                  style:const TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                AutoSizeText(
                  "${startymd[0]}",
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AutoSizeText(
                  "${endymd[2]}",
                  style:const TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                AutoSizeText(
                  "${endymd[1]}",
                  style:const TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                AutoSizeText(
                  "${endymd[0]}",
                  style:const TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(8),
              child: VerticalDivider(
                color: AppColors.black,
                width: 2,
              )),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 4,
                    child: AutoSizeText(
                      eventDetails.title,
                      textAlign: TextAlign.start,
                      maxLines: 5,
                      style: eventDiscriptionopicTextstyle(),
                    )),
                Expanded(
                    flex: 10,
                    child: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: AutoSizeText(
                          eventDetails.description,
                          maxLines: 5,
                          style: newsBodyTextstyle(),
                        ))),
                Expanded(
                    flex: 3,
                    child: BGGreenButton(
                      title: 'Register Now',
                      onPressed: onPressReadMore,
                    )),
                 SizedBox(
                  height:(MediaQuery.of(context).size.height) *0.005,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
