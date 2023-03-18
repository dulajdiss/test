import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/sponsors_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/sponsors_card.dart';
import 'package:ebbf/screen/common_widget/view_aal_next_btn.dart';
import 'package:ebbf/screen/events/widget/event_body.dart';
import 'package:ebbf/screen/home/widget/sample_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({super.key});

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<SponsorsModels> entries = showEBBF.sponsorsListValue;
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
              child: Text(
                'Sponsors',
                style: newsTextstyle(),
              ),
            ),
            if (entries.length != 0)
              SponsorsCard(
                controler: controller,
                entries: entries,
              ),
            if (entries.length > 1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: entries.length-1 ,
                    // ignore: prefer_const_constructors
                    effect: WormEffect(
                      dotHeight: 15,
                      dotWidth: 15,
                      type: WormType.thin,
                    ),
                  ),
                ),
              ),
          ]);
    });
  }
}
