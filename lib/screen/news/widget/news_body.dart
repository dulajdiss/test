import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatelessWidget {
  final onPressReadMore;
  final newsModel;
  const NewsBody({super.key, this.newsModel, this.onPressReadMore});

  @override
  Widget build(BuildContext context) {
    final Map<int, String> ymd = {
      for (int i = 0;
          i < newsModel.createdDate.toString().split('-').length;
          i++)
        i: newsModel.createdDate.toString().split('-')[i]
    };
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              newsModel.pic,
              width: (MediaQuery.of(context).size.width) * 0.95,
              height: (MediaQuery.of(context).size.height) * 0.3,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Container(
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
                        Text(
                          "${ymd[2]}",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                (MediaQuery.of(context).size.width) * 0.07,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${ymd[1]}", style: ddMonthyyyyTextstyle(context)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${ymd[0]}", style: ddmmyyyyTextstyle(context)),
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
                        Expanded(
                            flex: 6,
                            child: AutoSizeText(
                              newsModel.title,
                              textAlign: TextAlign.start,
                              maxLines: 5,
                              style: eventDiscriptionopicTextstyle(),
                            )),
                        Expanded(
                            flex: 4,
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  newsModel.description,
                                  style: newsBodyTextstyle(),
                                ))),
                        Expanded(
                            flex: 2,
                            child: BGGreenButton(
                              title: 'Read More',
                              onPressed: onPressReadMore,
                            )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
