import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final iconData;
  final title;
  final description;
  const CardContainer(
      {super.key, this.iconData, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width) * 0.45,
        height: (MediaQuery.of(context).size.width) * 0.45,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(iconData),
              Image(image: iconData),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.004,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.amber,
                  width: 1.0, // Underline thickness
                ))),
                child:FittedBox(child:  Text(
                  "$title",
                  style: countactUsGridTextstyle(),
                ),),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.004,
              ),
              Text(
                "$description",
                style: countactUsGridSubTextstyle(),
                textAlign: TextAlign.center,
              ),
              // Text(
              //   "Dubai, UAE",
              //   textAlign: TextAlign.center,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
