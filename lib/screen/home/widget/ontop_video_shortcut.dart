import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class OnTopVideoShortCutWidget extends StatelessWidget {
  final topic;
  final description;
  final onPress;
  const OnTopVideoShortCutWidget({Key? key, this.topic, this.description, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topic,
            textAlign: TextAlign.center,
            style: onVideoMSGTextStyle(),
          ),
          Text(description,
             textAlign: TextAlign.center,
            style: onVideoMSGBodyTextStyle(),
          ),
          TextButton(onPressed: onPress, child: Text(
            'Click Here ->',
            textAlign: TextAlign.center,
            style: onVideoMSGBodyTextStyle(),
          ),)
        ]);
  }
}
