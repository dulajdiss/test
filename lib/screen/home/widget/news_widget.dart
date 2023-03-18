import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/news_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/view_aal_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel news;
  const NewsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final Map<int, String> ymd = {
      for (int i = 0;
      i < news.createdDate.toString().split('-').length;
      i++)
        i: news.createdDate.toString().split('-')[i]
    };
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
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'News',
                  style: newsTextstyle(),
                ),
                ViewAllAndNextBtn(
                  onPressViewAll: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(14);
                  },
                ),
              ]),
        ),
        Center(
          child: Image.network(
           news.pic.toString(),
            width: (MediaQuery.of(context).size.width) * 0.80,
            height: (MediaQuery.of(context).size.height) * 0.20,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height) * 0.01,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width) * 0.2,
            top: (MediaQuery.of(context).size.width) * 0.01,
          ),
          child: Container(
              width: (MediaQuery.of(context).size.width) * 0.2,
              height: (MediaQuery.of(context).size.height) * 0.111,
              padding:
                  EdgeInsets.all((MediaQuery.of(context).size.width) * 0.03),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                children: [
                  Text(
                    "${ymd[2]}",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: (MediaQuery.of(context).size.width) * 0.054,
                    ),
                  ),
                  Text(
                    "${ymd[1]}",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.black,
                      fontSize: (MediaQuery.of(context).size.width) * 0.04,
                    ),
                  ),
                  Text(
                    "${ymd[0]}",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.black,
                      fontSize: (MediaQuery.of(context).size.width) * 0.04,
                    ),
                  )
                ],
              )),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * 1,
          height: (MediaQuery.of(context).size.height) * 0.37,
          padding: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width) * 0.2,
            right: (MediaQuery.of(context).size.width) * 0.1,
            bottom: (MediaQuery.of(context).size.width) * 0.02,
            top: (MediaQuery.of(context).size.width) * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 6,
                  child: AutoSizeText(
                    news.title.toString(), maxLines: 5,
                    style: newsTopicTextstyle(),
                  )),
              Expanded(
                  flex: 1,
                  child: BGGreenButton(
                    title: 'Read More',
                    onPressed: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(19);
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNewsDetails(news);
                    },
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
