// ignore_for_file: use_build_context_synchronously

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/course_model.dart';
import 'package:ebbf/models/course_type.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/services/fetch/fetch_course_data.dart';
import 'package:ebbf/services/fetch/fetch_course_time_slot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachDashboardCourses extends StatefulWidget {
  const CoachDashboardCourses({Key? key}) : super(key: key);

  @override
  State<CoachDashboardCourses> createState() => _CoachDashboardCoursesState();
}

class _CoachDashboardCoursesState extends State<CoachDashboardCourses> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<CourseModel> courseList = showEBBF.courseListValue;
      List<CourseType> courseTypeList = showEBBF.courseTypeListValue;
      return Scaffold(
          body: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitalBox(
            title: 'COURSES',
            direction: "Home > Courses",
          ),
          SizedBox(
              width: (MediaQuery.of(context).size.width) * 0.98,
              height: (MediaQuery.of(context).size.height) * 0.07,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.height) * 0.01),
                  itemCount: courseTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                color: selectIndex == index
                                    ? AppColors.green
                                    : AppColors.titleBoxBG,
                                border: Border.all(
                                  color: selectIndex == index
                                      ? AppColors.green
                                      : AppColors.titleBoxBG,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: EdgeInsets.all(
                                (MediaQuery.of(context).size.height) * 0.01),
                            child: MaterialButton(
                                onPressed: () async {
                                  setState(() {
                                    selectIndex = index;
                                  });
                                  await fetchCourseData(
                                          "${courseTypeList[index].ctId}")
                                      .then((courses) async {
                                    await Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .fetchCourseDataNotifire(courses);
                                    await Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .selectedCourseTypeNotifire(
                                            courseTypeList[index]);
                                  });
                                },
                                child: Text(
                                  '${courseTypeList[index].ctTitle}',
                                  style: TextStyle(
                                      color: selectIndex == index
                                          ? AppColors.white
                                          : AppColors.black),
                                ))));
                  })),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.98,
            height: (MediaQuery.of(context).size.height) * 0.64,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: courseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                        decoration: BoxDecoration(
                            color: courseList[index].enable.toString() == '1'
                                ? AppColors.green
                                : AppColors.titleBoxBG,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.all(10),
                        height: (MediaQuery.of(context).size.height) * 0.145,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width) * 0.3,
                                child: Text(
                                  'Course \n ${courseList[index].courseId}',
                                  textAlign: TextAlign.center,
                                  style:
                                      courseList[index].enable.toString() == '1'
                                          ? courseCardStyle()
                                          : courseCardStyleGrey(),
                                )),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                  Text(
                                    '${courseList[index].courseTitle}',
                                    style:
                                        courseList[index].enable.toString() ==
                                                '1'
                                            ? courseCardStyle()
                                            : courseCardStyleGreen(),
                                  ),
                                  Text(
                                    '${courseList[index].courseTitle} Exam',
                                    style:
                                        courseList[index].enable.toString() ==
                                                '1'
                                            ? courseCardStyleExam()
                                            : courseCardStyleExamGrey(),
                                  ),
                                  MaterialButton(
                                    color:
                                        courseList[index].enable.toString() ==
                                                '1'
                                            ? AppColors.white
                                            : AppColors.green,
                                    onPressed: () async {
                                      if (courseList[index].enable.toString() ==
                                          '1') {
                                        await fetchCourseTimeModelData(
                                                "${courseTypeList[index].ctId}")
                                            .then((coursesTime) async {
                                          await Provider.of<EBBFNotifier>(
                                                  context,
                                                  listen: false)
                                              .fetchCourseTimeSlotDataNotifire(
                                                  coursesTime);
                                          Provider.of<EBBFNotifier>(context,
                                                  listen: false)
                                              .setNavIndex(34);
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              backgroundColor:
                                                  Colors.deepOrangeAccent,
                                              content: Text(
                                                  "This Course is not enable")),
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                          color: courseList[index]
                                                      .enable
                                                      .toString() ==
                                                  '1'
                                              ? AppColors.green
                                              : AppColors.white),
                                    ),
                                  )
                                ]))
                          ],
                        )),
                  );
                }),
          )
        ],
      )));
    });
  }
}
