import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachDetails extends StatelessWidget {
  const CoachDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      String descriptionname = showEBBF.coachDetailsDescriptionName;
      String titalName = showEBBF.coachDetailsTitleName;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const HeaderWidget(), // ignore: prefer_const_constructors
              TitalBoxWithBackButton(
                title: titalName,
                direction: "Home > Coach > $descriptionname",
                onPress: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(showEBBF.previousSelectedIndex);
                },
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
                              image: AppImages.coachdetailsimage,
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
                          height: (MediaQuery.of(context).size.height) * 0.12,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Experience: ',
                                    style: coatchDetailsTextstyle()),
                                Text('Email: ',
                                    style: coatchDetailsTextstyle()),
                                Text('Phone: ',
                                    style: coatchDetailsTextstyle()),
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
                child: Text('Maher Georges Aount: ',
                    style: coatchDetailsPersonalTextstyle()),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: Text('Education: ',
                    style: coatchDetailsPersonalTextstyle()),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: Text('Expertise: ',
                    style: coatchDetailsPersonalTextstyle()),
              ),
              Padding(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.height) * 0.02),
                child: Text('Works for: ',
                    style: coatchDetailsPersonalTextstyle()),
              ),
            ],
          ),
        ),

        // ignore: unnecessary_new
        // bottomNavigationBar: BottomNavBarItems(
        //   ontap: (index) {
        //     bottomNavigationLogic(context, index);
        //   },
        // ),
        // endDrawer: const CustomeEndDrower()
      );
    });
  }
}
