import 'package:ebbf/models/news_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/news/news_details_page.dart';
import 'package:ebbf/screen/news/widget/news_body.dart';
import 'package:ebbf/utils/bottomnavigation_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<NewsModel> newsList = showEBBF.newsListValue;

      return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              const TitalBox(
                title: 'NEWS',
                direction: "Home > News",
              ),

              for (int i = 0; i < newsList.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.02,
                  ),
                  child: NewsBody(
                    newsModel: newsList[i],
                    onPressReadMore: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(19);
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNewsDetails(newsList[i]);
                    },
                  ),
                ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
            ]),
      );
    });
  }
}
