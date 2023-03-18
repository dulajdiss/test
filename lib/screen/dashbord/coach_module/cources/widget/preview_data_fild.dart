// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class BookPreViewDataFields extends StatelessWidget {
  final title;
  final description;
  final textStyle;
  const BookPreViewDataFields(
      {Key? key, this.title, this.description, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.width) * 0.025,
          bottom: (MediaQuery.of(context).size.width) * 0.025,
          left: (MediaQuery.of(context).size.width) * 0.05,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text('$title ', style: textStyle)),
              Text("$description", style: textStyle)
            ]));
  }
}
