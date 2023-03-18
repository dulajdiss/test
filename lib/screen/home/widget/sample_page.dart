import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/view_aal_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List pages = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          // decoration: BoxDecoration(
          //   color: AppColors.grey,
          //   borderRadius: BorderRadius.circular(12),
          // ),
          // width: (MediaQuery.of(context).size.width),
          // height: (MediaQuery.of(context).size.height) * 0.5,
          child: PageView.builder(
            controller: controller,
            itemCount: pages.length,
            itemBuilder: (_, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  (MediaQuery.of(context).size.width) * 0.054,
                            ),
                          ),
                          Text("OCT", style: ddmmyyyyTextstyle(context)),
                          Text("2020", style: ddmmyyyyTextstyle(context)),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.3,
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  (MediaQuery.of(context).size.width) * 0.054,
                            ),
                          ),
                          Text("OCT", style: ddmmyyyyTextstyle(context)),
                          Text("2020", style: ddmmyyyyTextstyle(context)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.6,
                    width: (MediaQuery.of(context).size.width) * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          "Scitec International Natural Bodybuilding Championship",
                          style: newsTopicTextstyle(),
                        )),
                        SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.2,
                            child: Text(
                              "Scitec International Natural Bodybuilding Championship",
                              style: newsBodyTextstyle(),
                            )),
                        BGGreenButton(
                          title: 'Read More',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: pages.length,
          effect: WormEffect(
            dotHeight: 16,
            dotWidth: 16,
            type: WormType.thin,
            // strokeWidth: 5,
          ),
        ),
      ],
    );
  }
}
