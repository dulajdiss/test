import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/course_time_model.dart';
import 'package:ebbf/models/course_type.dart';
import 'package:ebbf/models/gym_activities_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseBookInfo extends StatefulWidget {
  const CourseBookInfo({Key? key}) : super(key: key);

  @override
  State<CourseBookInfo> createState() => _CourseBookInfoState();
}

class _CourseBookInfoState extends State<CourseBookInfo> {
  List<bool> boolValue = [false];
  bool bookButtonOn = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<CourseTimeModel> ctm = showEBBF.courseTimeSlotListValue;
      boolValue = showEBBF.courseTimeSlotListBoolValue;
      // CourseType cotype = showEBBF.selectedCourseType;
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              TitalBoxWithBackButton(
                title: 'COURSES',
                direction: "Home > Courses BK",
                onPress: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(33);
                },
              ),
              Padding(
                padding: EdgeInsets.all(
                  (MediaQuery.of(context).size.width) * 0.05,
                ),
                child: Text(
                  '${ctm[0].courseTitle}-${ctm[0].amount} AED',
                  style: coursesPreliminary(
                    (MediaQuery.of(context).size.width) * 0.05,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) * 0.05,
                ),
                child: Text(
                  'Issue NOC for a new Trade License',
                  style: coursesSubText(
                    (MediaQuery.of(context).size.width) * 0.04,
                  ),
                ),
              ),
              for (int i = 0; i < ctm[0].courseslots!.length; i++)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.width) * 0.07,
                          left: (MediaQuery.of(context).size.width) * 0.05,
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Capacity : ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      (MediaQuery.of(context).size.width) *
                                          0.044,
                                ),
                              ),
                              Text(
                                "${ctm[0].courseslots![i].capacity} slots left : ${ctm[0].courseslots![i].slotsLeft}",
                                style: TextStyle(
                                  color: AppColors.black,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.bold,
                                  fontSize:
                                      (MediaQuery.of(context).size.width) *
                                          0.04,
                                ),
                              )
                            ]),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.height) * 0.01,
                          ),
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.05,
                            width: (MediaQuery.of(context).size.width) * 0.60,
                            child: CheckboxListTile(
                                selectedTileColor: Colors.white,
                                checkColor: Colors.white,
                                activeColor: AppColors.green,
                                shape: const CircleBorder(),
                                checkboxShape: const CircleBorder(),
                                // activeColor: Colors.transparent,
                                value: boolValue[i],
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (val) {
                                  for (int io = 0;
                                      io < boolValue.length;
                                      io++) {
                                    boolValue[io] = false;
                                  }
                                  boolValue[i] = true;
                                  bookButtonOn = true;
                                  Provider.of<EBBFNotifier>(context,
                                          listen: false)
                                      .setCourseTimeSlotListBoolValue(
                                          boolValue);
                                },
                                title: Container(
                                  padding: EdgeInsets.only(
                                      left:
                                          (MediaQuery.of(context).size.width) *
                                              0.02),
                                  alignment: const Alignment(-1, 0),
                                  height: (MediaQuery.of(context).size.height) *
                                      0.12,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.white,
                                  ),
                                  child: Text(
                                    ctm[0].courseslots![i].slotDate!,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      decoration: TextDecoration.none,
                                      // fontWeight: FontWeight.bold,
                                      fontSize:
                                          (MediaQuery.of(context).size.width) *
                                              0.035,
                                    ),
                                  ),
                                )),
                          ))
                    ]),

              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.195,
                  ),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        textColor: AppColors.white,
                        onPressed: () {
                          if (bookButtonOn) {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setNavIndex(38);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.grey,
                                  content: Text("Please select time slots")),
                            );
                          }
                        },
                        child: AutoSizeText(
                          "Book now",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize:
                                (MediaQuery.of(context).size.width) * 0.06,
                          ),
                        ),
                      ),
                    ),
                  ))
            ])),
      );
    });
  }
}
