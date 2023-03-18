import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/models/news_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/about/wigdet/history_details_box.dart';
import 'package:ebbf/screen/about/wigdet/info_box.dart';
import 'package:ebbf/screen/about/wigdet/info_box_borded.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_constructors
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            TitalBox(
              title: 'ABOUT EBBF',
              direction: "Home > About EBBF",
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            //this part repeate
            const Center(
              child: HistoryDetailsBox(
                  topic: "History Of EBBF",
                  description:
                      "The legacy of EBBF lies in perseverance. Sailing through humble beginnings and challenges, EBBF has come a long way over the past three decades. The exponential degree of growth and success it has achieved across its journey to reach where it stands tall and proud today is a matter of pride for the UAE."),
            ),
            const Center(
              child: HistoryDetailsBox(
                  topic: "1992",
                  description:
                      "Established as a temporary committee called the ‘Emirates Bodybuilding and Weightlifting committee’ by the decree of the ministry of General Authority of Youth & Sports Welfare. Under the visionary leadership of H.E. Dr Ahmed Saeed Al Kindi, it became a notable member of international Bodybuilding and Weightlifting federations across Asia and MENA."),
            ),
            const Center(
              child: HistoryDetailsBox(
                  topic: "1998",
                  description:
                      "The year 1998 was an immensely significant milestone for EBBF marking its transformation from a committee to a federation by the ruling of H.E. Sultan Bin Sheikh Mohammed Bin Mejren, the minister of the General Authority of Youth & Sports Welfare. Passing Resolution no. (18) on 12th June 1998 transformed the entity from a committee to a federation, officiating the name ‘Emirates Bodybuilding Federation’."),
            ),
            const Center(
              child: HistoryDetailsBox(
                  topic: "2008",
                  description:
                      "The year 2008 marked a substantial change in the structure of EBBF by the assignment of a dedicated body of Board of Directors for the session 2008-2012 under the chairmanship of H.E Osama Ahmed Abdullah Al Shafar. Another critical change was the segregation of Weightlifting as a sport under the category of Bodybuilding by the ruling of the Ministry of General Authority of Youth & Sports Welfare under Resolution no. (125)."),
            ),
            const Center(
              child: HistoryDetailsBox(
                  topic: "2009",
                  description:
                      "Sanctioned by the Ministry of General Authority of Youth & Sports Welfare, EBBF devised the ‘Emirates Powerlifting Committee’ and officially added the sport of Powerlifting under its umbrella."),
            ),
            const Center(
              child: HistoryDetailsBox(
                  topic: "2012",
                  description:
                      "On 27th June 2012, dictated by the Ministry of General Authority of Youth & Sports Welfare, the body of the Board of Directors was revised and elected for the 2012-2016 session under Resolution no. (29). H.H. Sheikh Maktoum bin Hamad Ali Sharqi became the Chairman of EBBF."),
            ),
            const Center(
              child: Text(
                "AND...",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
            ),
            InfoNewsBox(),
            InfoEventBoxBorded(),
            SizedBox(
              height: 25,
            )
          ],
        ),
      );

  }
}
