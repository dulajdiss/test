import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/models/coach_model.dart';
import 'package:ebbf/models/course_model.dart';
import 'package:ebbf/models/gender_model.dart';
import 'package:ebbf/models/location_module.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/coach/coach_profile.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/events/widget/dropdown_field.dart';
import 'package:ebbf/screen/events/widget/search_bar.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/search/coach_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachPage extends StatefulWidget {
  const CoachPage({super.key});

  @override
  State<CoachPage> createState() => _CoachPageState();
}

class _CoachPageState extends State<CoachPage> {
  bool loader = false;
  String currentGender = "Select Gender";
  String currentGenderId = "Select GenderId";
  List<String>? genderDataList = [];
  String currentCourse = "Select Course";
  String currentCourseId = "Select CourseId";
  List<String>? courseDataList = [];
  String currentLocation = "Select Location";
  String currentLocationId = "Select LocationId";
  List<String>? locationDataList = [];
  TextEditingController keyWordController = TextEditingController();

  setLocationList(List<LocationModule> llist) {
    locationDataList = [];
    locationDataList?.add("Select Location");
    for (int i = 0; i < llist.length; i++) {
      locationDataList?.add(llist[i].locationTitle!);
      if (currentLocation != "Select Location") {
        if (currentLocation == llist[i].locationTitle) {
          currentLocationId = llist[i].locationId!;
        }
      }
    }
  }

  setGenderList(List<GenderModel> glist) {
    genderDataList = [];
    genderDataList?.add("Select Gender");
    for (int i = 0; i < glist.length; i++) {
      genderDataList?.add(glist[i].genderTitle!);
      if (currentGender != "Select Gender") {
        if (currentGender == glist[i].genderTitle) {
          currentGenderId = glist[i].genderId!;
        }
      }
    }
  }

  setCourseList(List<CourseModel> slist) {
    courseDataList = [];
    courseDataList?.add("Select Course");
    for (int i = 0; i < slist.length; i++) {
      courseDataList?.add(slist[i].courseTitle!);
      if (currentCourse != "Select Gender") {
        if (currentCourse == slist[i].courseTitle) {
          currentCourseId = slist[i].courseId!;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<CoachModel> coachList = showEBBF.coachSearchResult;
      setLocationList(showEBBF.locationList);
      setGenderList(showEBBF.genderList);
      setCourseList(showEBBF.courseDropList);
      return RefreshIndicator(
          onRefresh: () async => await apiServiceHelper(context, APIName.COACH),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                const TitalBox(
                  title: 'COACH',
                  direction: "Home > Coach",
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width) * 0.015,
                  ),
                  child: DropDownField(
                    currentSelectedValue: currentLocation,
                    onChange: (value) {
                      setState(() {
                        currentLocation = value;
                        loader = false;
                      });
                    },
                    dataList: locationDataList,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.015),
                  child: DropDownField(
                    currentSelectedValue: currentGender,
                    onChange: (value) {
                      setState(() {
                        currentGender = value;
                        loader = false;
                      });
                    },
                    dataList: genderDataList,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width) * 0.015,
                  ),
                  child: DropDownField(
                    currentSelectedValue: currentCourse,
                    onChange: (value) {
                      setState(() {
                        currentCourse = value;
                        loader = false;
                      });
                    },
                    dataList: courseDataList,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width) * 0.01,
                  ),
                  child: TextFormField(
                      controller: keyWordController,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: AppColors.green,
                            width: 1.0,
                          ),
                        ),
                        fillColor: AppColors.white,
                        filled: true,
                        hintText: "Coach",
                        hintStyle: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      onSaved: (String? value) {},
                      validator: (val) {}),
                ),
                SearchBarButton(
                  loader: loader,
                  onPressed: () async {
                    setState(() {
                      loader = !loader;
                    });
                    setLocationList(showEBBF.locationList);
                    setGenderList(showEBBF.genderList);
                    setCourseList(showEBBF.courseDropList);
                    await fetchCoachSearch(keyWordController.text,
                            currentLocationId, currentGenderId, currentCourseId)
                        .then((value) async {
                      await Provider.of<EBBFNotifier>(context, listen: false)
                          .fetchCoachSearchResultNotifire(value);
                      setState(() {
                        loader = !loader;
                      });
                    });
                  },
                ),
                  for (int i = 0; i < coachList.length; i += 2)
                    (i + 1 == coachList.length && coachList.length % 2 == 1)
                        ? InkWell(
                            child: CoachProfile(coach: coachList[i]),
                            onTap: () {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setNavIndex(35);
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .goCoachDetailsPage(
                                      titleName: 'Athlete',
                                      descriptionName: "Name Of Athlete");
                            })
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                InkWell(
                                    child: CoachProfile(coach: coachList[i]),
                                    onTap: () {
                                      Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .setNavIndex(35);
                                      Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .goCoachDetailsPage(
                                              titleName: 'Athlete',
                                              descriptionName:
                                                  "Name Of Athlete");
                                    }),
                                InkWell(
                                    child:
                                        CoachProfile(coach: coachList[i + 1]),
                                    onTap: () {
                                      Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .setNavIndex(35);
                                      Provider.of<EBBFNotifier>(context,
                                              listen: false)
                                          .goCoachDetailsPage(
                                              titleName: 'Athlete',
                                              descriptionName:
                                                  "Name Of Athlete");
                                    })
                              ]),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.04,
                ),
              ],
            ),
            // ),

            // ignore: unnecessary_new
            // bottomNavigationBar: BottomNavBarItems(
            //   ontap: (index) {
            //     bottomNavigationLogic(context, index);
            //   },
            // ),
            // endDrawer: const CustomeEndDrower()
          ));
    });
  }
}
