import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class TitalBoxWithBackButton extends StatelessWidget {
  final title;
  final direction;
  final onPress;
  const TitalBoxWithBackButton(
      {super.key, this.title, this.direction, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.titleBoxBG,
        padding:
            EdgeInsets.only(left: (MediaQuery.of(context).size.width) * 0.01),
        width: (MediaQuery.of(context).size.width) * 0.98,
        height: (MediaQuery.of(context).size.height) * 0.15,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackButton(
                onPressed: onPress,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
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
            ]),
      ),
    );
  }
}
