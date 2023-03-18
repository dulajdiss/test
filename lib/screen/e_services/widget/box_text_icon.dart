import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BoxTextIcon extends StatelessWidget {
  final box_color;
  final box_text;
  final box_text_color;
  final box_icon;
  final box_onpress;
  const BoxTextIcon(
      {Key? key,
      this.box_color,
      this.box_text,
      this.box_text_color,
      this.box_icon,
      this.box_onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: box_color,
        height: (MediaQuery.of(context).size.width) * 0.12,
        width: (MediaQuery.of(context).size.width) * 0.90,
        padding: const EdgeInsets.all(3),
        // ignore: prefer_const_constructors

        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width) * 0.05),
                  child: AutoSizeText(
                    '$box_text',
                    maxLines: 1,
                    style: TextStyle(
                      color: box_text_color,
                      fontSize: (MediaQuery.of(context).size.width) * 0.031,
                    ),
                  )),
              IconButton(onPressed: box_onpress, icon: box_icon)
            ]));
  }
}
