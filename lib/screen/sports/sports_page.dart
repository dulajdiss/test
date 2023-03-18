import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/events/events_page.dart';
import 'package:ebbf/screen/sports/widget/sport_card.dart';
import 'package:ebbf/utils/bottomnavigation_logic.dart';
import 'package:flutter/material.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<SportsModels> entries = showEBBF.sportsListValue;
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
                title: 'SPORTS',
                direction: "Home > About EBBF > Sports",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              for (int i = 0; i < entries.length; i++)
                SportCards(
                  sportData: entries[i],
                ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
            ]), // ignore: unnecessary_new
        // bottomNavigationBar: BottomNavBarItems(
        //   ontap: (index) {
        //     bottomNavigationLogic(context, index);
        //   },
        // ),
        // endDrawer: const CustomeEndDrower()
      );
    });
  }
}
