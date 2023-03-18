import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/gyms_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GymDetails extends StatelessWidget {
  const GymDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      GymsModel gymInfo = showEBBF.singleGymDetails;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitalBox(
                title: '${gymInfo.title}',
                direction: "Home > Gyms > ${gymInfo.title}",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.height) * 0.02),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: (MediaQuery.of(context).size.height) * 0.01,
                          ),
                          child: Center(
                            child: Image(
                              image: AppImages.gymdetailimage,
                              width: (MediaQuery.of(context).size.width) * 0.90,
                              height:
                                  (MediaQuery.of(context).size.height) * 0.5,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.white,
                          padding: EdgeInsets.only(
                              left:
                                  (MediaQuery.of(context).size.height) * 0.02),
                          width: (MediaQuery.of(context).size.width) * 0.88,
                          height: (MediaQuery.of(context).size.height) * 0.2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Email: ${gymInfo.email} ',
                                    style: coatchDetailsTextstyle()),
                                Text('Phone: ',
                                    style: coatchDetailsTextstyle()),
                                Text('Website: ${gymInfo.website}',
                                    style: coatchDetailsTextstyle()),
                                Center(
                                  child: BGGreenButton(
                                    title: "Location",
                                    onPressed: () {},
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child:
                    Text('Introduction: ', style: gymDetailsTopicTextstyle()),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.height) * 0.02),
                child: Text('${gymInfo.introduction}',
                    style: gymDetailsDescriptionTextstyle()),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: Text('Specialities:', style: gymDetailsTopicTextstyle()),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.height) * 0.02),
                child: Text('${gymInfo.specialities}',
                    style: gymDetailsDescriptionTextstyle()),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: Text('Activities: ', style: gymDetailsTopicTextstyle()),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: Text('Our Coaches: ', style: gymDetailsTopicTextstyle()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
