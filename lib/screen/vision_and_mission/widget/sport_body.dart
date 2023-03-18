import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:flutter/cupertino.dart';

class SportBody extends StatelessWidget {
  final SportsModels sportData;
  const SportBody({super.key, required this.sportData});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all((MediaQuery.of(context).size.width) * 0.16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.01),
                child: AutoSizeText(
                  sportData.title.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: visionMissionSportTextstyle(),
                )),
            Expanded(
                child: Container(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.035),
                color: AppColors.green,
                child: AutoSizeText(
                  sportData.description.toString(),
                  maxLines: 15,
                  textAlign: TextAlign.center,
                  style: visionMissionSportTextstyle(),
                )))
          ],
        ));
  }
}
