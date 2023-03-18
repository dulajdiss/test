import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/models/news_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/home/widget/event_widget.dart';
import 'package:ebbf/screen/home/widget/news_widget.dart';
import 'package:ebbf/screen/home/widget/ontop_video_shortcut.dart';
import 'package:ebbf/screen/home/widget/sponsors.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  PageController controller = PageController();
  PageController eventController = PageController();
  // ignore: prefer_final_fields
  List<Widget> _topicShortCutPageList = [];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.ebbf.ae/beta/frontfiles/banners/Untitled.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((value) {
      setState(() {
        _controller.play();
        _controller.setVolume(0.0);
      });
    });
    _controller.setLooping(true).then((value) {
      setState(() {});
    });
    _topicShortCutPageList = <Widget>[
      OnTopVideoShortCutWidget(
        topic: "GYM",
        description:
            "By evaluating and ensuring adherence to safety protocols and quality standards, EBBF grants licenses to all gyms and fitness centres to operate in the UAE",
        onPress: () {
          Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(1);
        },
      ),
      OnTopVideoShortCutWidget(
        topic: "COACH",
        description:
            "EBBF issues membership to bodybuilding and fitness coaches to professionally impart body building and fitness training in the UAE.",
        onPress: () {
          Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(2);
        },
      ),
      OnTopVideoShortCutWidget(
        topic: "ATHLETE",
        description:
            "EBBF bestows membership to athletes, permitting them to participate in regional and international competitions of their respective domains.",
        onPress: () {
          Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(3);
        },
      )
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      int homeEventMovingIndex = showEBBF.homeEventIndex;
      List<NewsModel> newsList = showEBBF.newsListValue;
      // List<SponsorsModels> sponsorsList = showEBBF.sponsorsListValue;
      return RefreshIndicator(
          onRefresh: () async => await apiServiceHelper(context, APIName.ALL),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.8,
                    child: Center(
                        child: Center(
                            child: _controller.value.isInitialized
                                ? Stack(children: [
                                    VideoPlayer(_controller),
                                    Positioned(
                                        left: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.05,
                                        right: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.05,
                                        bottom: (MediaQuery.of(context)
                                                .size
                                                .height) *
                                            0.05,
                                        child: Column(children: [
                                          SizedBox(
                                            width: (MediaQuery.of(context)
                                                .size
                                                .width),
                                            height: (MediaQuery.of(context)
                                                    .size
                                                    .height) *
                                                0.3,
                                            child: PageView(
                                              scrollDirection: Axis.horizontal,
                                              controller: controller,
                                              onPageChanged: (num) {
                                                // setState(() {
                                                //   _curr = num;
                                                // });
                                              },
                                              children: _topicShortCutPageList,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: SmoothPageIndicator(
                                                controller: controller,
                                                count: _topicShortCutPageList
                                                    .length,
                                                // ignore: prefer_const_constructors
                                                effect: WormEffect(
                                                  dotHeight: 16,
                                                  dotWidth: 16,
                                                  type: WormType.thin,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]))
                                  ])
                                : Stack(children: [
                                    Image(
                                      width:
                                          (MediaQuery.of(context).size.height),
                                      height:
                                          (MediaQuery.of(context).size.height),
                                      fit: BoxFit.fill,
                                      image: AppImages.videothumbnel,
                                    ),
                                    const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.white,
                                      ),
                                    )
                                  ])))),
                NewsWidget(news: newsList[0]),
                const Divider(
                  color: AppColors.green,
                  thickness: 3,
                ),
                Center(
                    child: Stack(children: [
                  EventWidget(eventController: eventController),
                  Positioned(
                    top: (MediaQuery.of(context).size.height) * 0.55,
                    bottom: (MediaQuery.of(context).size.height) * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          color: AppColors.green,
                          child: IconButton(
                            icon: const Icon(Icons.navigate_before),
                            onPressed: () {
                              if (homeEventMovingIndex > 0) {
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setHomeEventMovingButton(
                                        homeEventMovingIndex - 1);
                              }
                              // use this to animate to the page
                              eventController.animateToPage(
                                homeEventMovingIndex - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          )),
                    ),
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width) * 0.86,
                    top: (MediaQuery.of(context).size.height) * 0.55,
                    bottom: (MediaQuery.of(context).size.height) * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          color: AppColors.green,
                          child: IconButton(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setHomeEventMovingButton(
                                      homeEventMovingIndex - 1);
                              // use this to animate to the page
                              eventController.animateToPage(
                                homeEventMovingIndex + 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          )),
                    ),
                  ),
                ])),
                Divider(
                  color: AppColors.green,
                  thickness: 3,
                ),
                const Sponsors()
              ],
            ),
          ));
    });
  }
}
