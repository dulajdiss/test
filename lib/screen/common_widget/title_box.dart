import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class TitalBox extends StatelessWidget {
  final title;
  final direction;
  const TitalBox({super.key, this.title, this.direction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.titleBoxBG,
        padding:
            EdgeInsets.only(left: (MediaQuery.of(context).size.width) * 0.05),
        width: (MediaQuery.of(context).size.width) * 0.98,
        height: (MediaQuery.of(context).size.height) * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: FittedBox(
                child: Text(
                  title,
                  style: titleBoxTitleTextStyle(),
                ),
              ),
            ),
            Text(
              direction,
              style: titleBoxDiscriptionTextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
