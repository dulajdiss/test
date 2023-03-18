// ignore_for_file: use_build_context_synchronously

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/about/about_page.dart';
import 'package:ebbf/screen/athletes/athletes_page.dart';
import 'package:ebbf/screen/board_of_directors/board_of_directors_page.dart';
import 'package:ebbf/screen/coach/coach_details.dart';
import 'package:ebbf/screen/coach/coach_page.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/contact_us/contact_us_page.dart';
import 'package:ebbf/screen/dashbord/athlete_module/add_achievements.dart';
import 'package:ebbf/screen/dashbord/athlete_module/add_sport_associate_page.dart';
import 'package:ebbf/screen/dashbord/athlete_module/dashboard_achievements.dart';
import 'package:ebbf/screen/dashbord/dashboard_change_password.dart';
import 'package:ebbf/screen/dashbord/dashboard_details.dart';
import 'package:ebbf/screen/dashbord/athlete_module/dashboard_events.dart';
import 'package:ebbf/screen/dashbord/athlete_module/dashboard_events_register.dart';
import 'package:ebbf/screen/dashbord/dashboard_membership.dart';
import 'package:ebbf/screen/dashbord/athlete_module/dashboard_sport_associated.dart';
import 'package:ebbf/screen/e_services/e_service_page.dart';
import 'package:ebbf/screen/e_services/renew_license.dart';
import 'package:ebbf/screen/dashbord/gym_module/dashboard_activities.dart';
import 'package:ebbf/screen/dashbord/gym_module/dashboard_coach_approvals.dart';
import 'package:ebbf/screen/dashbord/dashboard_profile.dart';
import 'package:ebbf/screen/dashbord/gym_module/noc.dart';
import 'package:ebbf/screen/dashbord/organizer_module/add_edit_event_organizer.dart';
import 'package:ebbf/screen/dashbord/organizer_module/dashboard_event_organizer.dart';
import 'package:ebbf/screen/events/events_page.dart';
import 'package:ebbf/screen/events/singal_event_details.dart';
import 'package:ebbf/screen/gym/gym_details.dart';
import 'package:ebbf/screen/gym/gym_page.dart';
import 'package:ebbf/screen/home/home.dart';
import 'package:ebbf/screen/media/media_page.dart';
import 'package:ebbf/screen/news/news_details_page.dart';
import 'package:ebbf/screen/news/news_page.dart';
import 'package:ebbf/screen/president_message/president_message.dart';
import 'package:ebbf/screen/dashbord/dashboard_landing_page.dart';
import 'package:ebbf/screen/profile/edit_profile.dart';
import 'package:ebbf/screen/sign_in_out/login_page.dart';
import 'package:ebbf/screen/sign_in_out/otp_verify_page.dart';
import 'package:ebbf/screen/sign_in_out/signup_page.dart';
import 'package:ebbf/screen/sports/sport_details_page.dart';
import 'package:ebbf/screen/sports/sports_page.dart';
import 'package:ebbf/screen/vision_and_mission/vision_and_mission.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/dashbord/coach_module/cources/dashboard_coach_courses.dart';
import 'screen/dashbord/coach_module/cources/dashboard_course_book.dart';
import 'screen/dashbord/coach_module/cources/dashboard_course_book_preview.dart';
import 'screen/dashbord/organizer_module/dashboard_org_athletic_appication.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  int navX = 0;
  Color boxColor = AppColors.white;
  bool boxText = false;
  List pagesList = [
    const HomePage(), //0
    const GymPage(),
    const CoachPage(),
    const AthletesPage(),
    const DashBoardLandingPage(),
    const SportsPage(), //5
    const AboutPage(),
    const BoardOfDirectorsPage(),
    const ContactUspage(),
    const AddAchievement(),
    const DashboardAchievement(), //10
    const DashboardDetailsPage(),
    const DashboardProfile(),
    const EventsPage(),
    const NewsPage(),
    const PresidentMSG(), //15
    const SignUpPage(),
    const LogInPage(),
    const VisionAndMission(),
    const NewsDetailsPage(),
    const SingleEventDetailsPage(), //20
    const GymDetails(),
    const SportDetailsPage(),
    const MediaPage(),
    const DashboardEvents(),
    const OTPVerifyPage(), //25
    const EditProfilePage(),
    const DashBoardEventsRegister(),
    const DashBoardMemberShip(),
    const DashboardSportAssociated(),
    const ChangePasswordPage(), //30
    const CoachApprovals(),
    const GymActivities(),
    const CoachDashboardCourses(),
    const CourseBookInfo(),
    const CoachDetails(), //35
    const NOCPage(),
    const EServicesPage(),
    const CourseBookPreView(),
    const ReNewLicense(),
    const AddSportAssociated(), //40
    const DashboardEventsOrganizer(),
    const AddEventsOrganizer(),
    const AthleticOrgApprovals(), //43
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      int selectIndex = showEBBF.selectedIndex;
      if (selectIndex < 5) {
        _tabController.index = selectIndex;
        navX = selectIndex;
        boxText = false;
        boxColor = AppColors.white;
      } else if (selectIndex == 10 ||
          selectIndex == 11 ||
          selectIndex == 12 ||
          selectIndex == 24 ||
          selectIndex == 28 ||
          selectIndex == 29 ||
          selectIndex == 30 ||
          selectIndex == 31 ||
          selectIndex == 32 ||
          selectIndex == 33 ||
          selectIndex == 34 ||
          selectIndex == 36 ||
          selectIndex == 38 ||
          selectIndex == 39 ||
          selectIndex == 40 ||
          selectIndex == 41 ||
          selectIndex == 42 ||
          selectIndex == 43) {
        _tabController.index = 4;
        navX = 4;
        boxText = false;
        boxColor = AppColors.white;
      } else if (selectIndex > 5 || navX != selectIndex) {
        boxColor = AppColors.green;
        boxText = true;
      }

      return WillPopScope(
          onWillPop: () => Provider.of<EBBFNotifier>(context, listen: false)
              .setNavIndex(showEBBF.previousSelectedIndex),
          child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.white,
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(
                        (MediaQuery.of(context).size.height) *
                            0.1), // Set this height
                    child: const HeaderWidget()),
                body: pagesList[selectIndex],
                bottomNavigationBar: BottomAppBar(
                  child: Container(
                    color: AppColors.green,
                    child: TabBar(
                      onTap: (x) async {
                        setState(() {
                          navX = x;
                        });
                        await read(SharedPreferencesConstant.userId).then((id) {
                          if (id != null || x != 4) {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setNavIndex(x);
                          } else {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setNavIndex(17);
                          }
                        });
                        if (x == 1) {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .fetchGymsDataNotifire(showEBBF.gymsListValue);
                        } else if (x == 2) {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .fetchCoachDataNotifire(showEBBF.coachListValue);
                        } else if (x == 3) {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .fetchAthleteDataNotifire(
                                  showEBBF.athleteListValue);
                        }
                      },
                      indicator: BoxDecoration(color: boxColor),
                      tabs: <Widget>[
                        Tab(
                          // backgroundColor: Colors.white,
                          icon: const Image(
                            fit: BoxFit.contain,
                            image: AppImages.nav_home,
                            width: 35,
                            height: 35,
                          ),
                          child: Text("Home",
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width) * 0.035,
                                  color: boxText
                                      ? Colors.white
                                      : navX == 0
                                          ? AppColors.green
                                          : Colors.white)),
                        ),
                        Tab(
                          icon: const Image(
                            image: AppImages.nav_gym,
                            width: 35,
                            height: 35,
                          ),
                          child: Text("Gym",
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width) * 0.035,
                                  color: boxText
                                      ? Colors.white
                                      : navX == 1
                                          ? AppColors.green
                                          : Colors.white)),
                        ),
                        Tab(
                          icon: const Image(
                            image: AppImages.nav_coach,
                            width: 35,
                            height: 35,
                          ),
                          child: Text("Coach",
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width) * 0.035,
                                  color: boxText
                                      ? Colors.white
                                      : navX == 2
                                          ? AppColors.green
                                          : Colors.white)),
                        ),
                        Tab(
                          icon: const Image(
                            image: AppImages.nav_athelatics,
                            width: 35,
                            height: 35,
                          ),
                          child: Text("Athlete",
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width) * 0.035,
                                  color: boxText
                                      ? Colors.white
                                      : navX == 3
                                          ? AppColors.green
                                          : Colors.white)),
                        ),
                        Tab(
                          icon: const Image(
                            image: AppImages.nav_profile,
                            width: 35,
                            height: 35,
                          ),
                          child: Text("Profile",
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width) * 0.035,
                                  color: boxText
                                      ? Colors.white
                                      : navX == 4
                                          ? AppColors.green
                                          : Colors.white)),
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
                endDrawer: const CustomeEndDrower()),
          ));
    });
    // body:
  }
}
