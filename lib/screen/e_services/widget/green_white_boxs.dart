import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class GreenAndWhiteBox extends StatelessWidget {
  final title;
  final description;
  const GreenAndWhiteBox({Key? key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width) * 0.005),
            child: Container(
                height: (MediaQuery.of(context).size.width) * 0.1,
                width: (MediaQuery.of(context).size.width) * 0.40,
                alignment: const Alignment(-1, 0),
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width) * 0.04),
                color: AppColors.green,
                child: Text(
                  "$title",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: (MediaQuery.of(context).size.width) * 0.03,
                  ),
                ))),
        Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width) * 0.005),
            child: Container(
                height: (MediaQuery.of(context).size.width) * 0.1,
                width: (MediaQuery.of(context).size.width) * 0.50,
                alignment: const Alignment(-1, 0),
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width) * 0.03),
                color: AppColors.white,
                child: Text(
                  "$description",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: (MediaQuery.of(context).size.width) * 0.03,
                  ),
                )))
      ],
    );
  }
}
