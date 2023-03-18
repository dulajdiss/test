import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/sports/sports_page.dart';
import 'package:ebbf/utils/bottomnavigation_logic.dart';
import 'package:flutter/material.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class PresidentMSG extends StatefulWidget {
  const PresidentMSG({super.key});

  @override
  State<PresidentMSG> createState() => _PresidentMSGState();
}

class _PresidentMSGState extends State<PresidentMSG> {
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
            const TitalBox(
              title: 'FEDERATION PRESIDENT MESSAGE',
              direction: "Home > About Us > Federation President Message",
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.05,
            ),
            Center(
              child: Image(
                image: AppImages.director1,
                width: (MediaQuery.of(context).size.width) * 0.90,
                height: (MediaQuery.of(context).size.height) * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Message from the Federation President',
                  textAlign: TextAlign.center,
                  style: presidentMSGTitleTextstyle(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                """I am thrilled to welcome you to the official website of the Emirates Bodybuilding Federation.

The journey made by EBBF in the past three decades is exemplary. Ascending from a small committee to its grand stature as the official Government Regulatory Body for the Bodybuilding & Fitness sector is nothing short of an inspiring legend.

I envision EBBF as a platform providing strategic advantage to the UAE in establishing itself as the pioneer of Bodybuilding & Fitness sports. By empowering and uplifting fitness athletes at all levels, EBBF aims to propel UAE further at the global forefront. Sports & recreation are one of the benchmarks to measure social development in the UAE. Bodybuilding & fitness holds a monumental significance for the global sports industry. Hence, an enormous responsibility lies on EBBF to substantiate the values, spirit and objective of sports.

To enhance the health and well-being of the people of UAE is one of the crucial objectives of EBBF. I believe that the integration of EBBF with eminent international federations to propagate the awareness of sports will positively correspond with the health and well-being of the people of UAE.

The affiliation of EBBF with the International Bodybuilding Federation testifies its compliance to the international standards and abidance to the code of conduct issued by the World Anti-Doping Association. EBBF champions and inculcates clean and progressive bodybuilding & fitness practices among all its stakeholders. It also strives to accommodate and develop the best bodybuilding and fitness talent by harnessing their capabilities and talent through the world’s best trainers, amenities and events.

On that note, I encourage the global Bodybuilding & Fitness fraternity to collaborate with EBBF and contribute to achieving new milestones of success for Bodybuilding & Fitness sports in the future""",
                textAlign: TextAlign.start,
                style: presidentMsgBoadyTextstyle(),
              ),
            )
          ]), // ignore: unnecessary_new
      // bottomNavigationBar: BottomNavBarItems(
      //   ontap: (index) {
      //     bottomNavigationLogic(context, index);
      //   },
      // ),
      // endDrawer: const CustomeEndDrower()
    );
  }
}
