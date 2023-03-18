import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/course_time_model.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/dashbord/coach_module/cources/widget/preview_data_fild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseBookPreView extends StatefulWidget {
  const CourseBookPreView({Key? key}) : super(key: key);

  @override
  State<CourseBookPreView> createState() => _CourseBookPreViewState();
}

class _CourseBookPreViewState extends State<CourseBookPreView> {
  late CoursesSlot coursesSlot;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      for (int i = 0; i < showEBBF.courseTimeSlotListBoolValue.length; i++) {
        if (showEBBF.courseTimeSlotListBoolValue[i]) {
          coursesSlot = showEBBF.courseTimeSlotListValue[0].courseslots![i];
        }
      }
      UserModel user = showEBBF.currentUser;
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
                direction: "Home > Courses Preview",
                onPress: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(showEBBF.previousSelectedIndex);
                },
              ),
              Padding(
                padding: EdgeInsets.all(
                  (MediaQuery.of(context).size.width) * 0.05,
                ),
                child: Text(
                  'Payment',
                  style: coursesPreliminary(
                    (MediaQuery.of(context).size.width) * 0.05,
                  ),
                ),
              ),
              Divider(
                height: (MediaQuery.of(context).size.width) * 0.025,
                indent: (MediaQuery.of(context).size.width) * 0.05,
                endIndent: (MediaQuery.of(context).size.width) * 0.05,
                color: AppColors.grey,
                thickness: 1,
              ),
              BookPreViewDataFields(
                title: "Name :",
                description: user.fullname,
                textStyle: TextStyle(
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              BookPreViewDataFields(
                title: "Email Id :",
                description: user.email,
                textStyle: TextStyle(
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              BookPreViewDataFields(
                title: "Phone no :",
                description: user.userType,
                textStyle: TextStyle(
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              BookPreViewDataFields(
                title: "Course :",
                description: showEBBF.courseTimeSlotListValue[0].courseTitle,
                textStyle: TextStyle(
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              BookPreViewDataFields(
                title: "Booking slot :",
                description: coursesSlot.slotDate,
                textStyle: TextStyle(
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              Divider(
                height: (MediaQuery.of(context).size.width) * 0.025,
                indent: (MediaQuery.of(context).size.width) * 0.05,
                endIndent: (MediaQuery.of(context).size.width) * 0.05,
                color: AppColors.grey,
                thickness: 1,
              ),
              BookPreViewDataFields(
                title: "Amount",
                description: "1.90",
                textStyle: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              BookPreViewDataFields(
                title: "VAT",
                description: "0.01",
                textStyle: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              BookPreViewDataFields(
                title: "Total amount",
                description: "2.00",
                textStyle: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: (MediaQuery.of(context).size.width) * 0.044,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
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
                        onPressed: () {},
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
