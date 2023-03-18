import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/home/home.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/screen/news/widget/news_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ebbf/models/news_model.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  late NewsModel news;
  late List<NewsModel> newsList = [];
  List<Widget> childrenOfNewsBody = [];
  // this variable determnines whether the back-to-top button is shown or not
  PageController controller = PageController();

  // scroll controller
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the scroll controller
    controller.dispose(); // dispose the controller
    super.dispose();
  }

  void createNewsBody(List<NewsModel> newsList) {
    childrenOfNewsBody = [];
    for (int i = 0; i < newsList.length; i++) {
      childrenOfNewsBody.add(
        NewsBody(
          newsModel: newsList[i],
          onPressReadMore: () {
            setState(() {
              _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            });
            Provider.of<EBBFNotifier>(context, listen: false).setNavIndex(19);
            Provider.of<EBBFNotifier>(context, listen: false)
                .setNewsDetails(newsList[i]);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      news = showEBBF.singleNewsDetails;
      newsList = showEBBF.newsListValue;
      int newsDetalsMovingIndex = showEBBF.newsDetailsMovingIndex;
      createNewsBody(showEBBF.newsListValue);

      return SingleChildScrollView(
        controller: _scrollController,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              TitalBox(
                title: 'NEWS Details',
                direction: "Home > News > ${news.title}",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              Center(
                child: Image.network(
                  news.pic.toString(),
                  width: (MediaQuery.of(context).size.width) * 0.95,
                  height: (MediaQuery.of(context).size.height) * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.02,
              ),
              Text(
                news.title.toString(),
                textAlign: TextAlign.center,
                style: newsDetailsTextstyle(),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.02),
                child: Text(
                  news.description.toString(),
                  textAlign: TextAlign.center,
                  style: newsDetailsBodyTextstyle(),
                ),
              ),
              Center(
                child: Text(
                  "OTHER RECENT NEWS",
                  textAlign: TextAlign.center,
                  style: newsDetailsTextstyle(),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.02,
              ),
              Center(
                  child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Center(
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8),
                        height: (MediaQuery.of(context).size.height) * 0.7,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          onPageChanged: (num) {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .newsDetailsMovingFunction(num);
                          },
                          children: childrenOfNewsBody,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height) * 0.4,
                    bottom: (MediaQuery.of(context).size.height) * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          color: AppColors.green,
                          child: IconButton(
                            icon: const Icon(Icons.navigate_before),
                            onPressed: () {
                              if (newsDetalsMovingIndex > 0) {
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .newsDetailsMovingFunction(
                                        newsDetalsMovingIndex - 1);
                              }
                              // use this to animate to the page
                              controller.animateToPage(
                                newsDetalsMovingIndex - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          )),
                    ),
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width) * 0.86,
                    top: (MediaQuery.of(context).size.height) * 0.4,
                    bottom: (MediaQuery.of(context).size.height) * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          color: AppColors.green,
                          child: IconButton(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .newsDetailsMovingFunction(
                                      newsDetalsMovingIndex + 1);
                              // use this to animate to the page
                              controller.animateToPage(
                                newsDetalsMovingIndex + 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          )),
                    ),
                  ),
                ],
                //   )
                // ],
              ))
            ]),
        // ),
        // ignore: unnecessary_new
        // bottomNavigationBar: BottomNavBarItems(
        //   ontap: (index) {
        //     Provider.of<EBBFNotifier>(context, listen: false)
        //         .setNavIndex(index);
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => const HomePage()),
        //     );
        //   },
        // ),
        // endDrawer: const CustomeEndDrower()
      );
    });
  }
}
