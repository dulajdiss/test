import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class HistoryDetailsBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final topic;
  // ignore: prefer_typing_uninitialized_variables
  final description;
  const HistoryDetailsBox({super.key, this.topic, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topic,
            textAlign: TextAlign.center,
            style: aboutDetailsBoxTopicTextstyle(),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: aboutDetailsBoxDescriptionTextstyle(),
          ),
          Image(image: AppImages.aboutHipent,
            height: (MediaQuery.of(context).size.height) * 0.1,
            width: (MediaQuery.of(context).size.width) * 0.1,)

        ],
      ),
    );
  }
}
