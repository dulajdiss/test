import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class CoachProfile extends StatelessWidget {
  final coach;
  const CoachProfile({super.key, this.coach});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((MediaQuery.of(context).size.width) * 0.005),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: (MediaQuery.of(context).size.height) * 0.05,
              ),
              child: Center(
                child: SizedBox(
                  child: Image.network(
                    coach.pic.toString(),
                    width: (MediaQuery.of(context).size.width) * 0.44,
                    height: (MediaQuery.of(context).size.height) * 0.15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.green,
            width: (MediaQuery.of(context).size.width) * 0.42,
            height: (MediaQuery.of(context).size.height) * 0.05,
            child: Center(
              child: Text(coach.title, style: directorNameTextstyle()),
            ),
          )
        ],
      ),
    );
  }
}
