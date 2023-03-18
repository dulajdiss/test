import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/dashbord/widget/profile_card.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardLandingPage extends StatefulWidget {
  const DashBoardLandingPage({Key? key}) : super(key: key);

  @override
  State<DashBoardLandingPage> createState() => _DashBoardLandingPageState();
}

class _DashBoardLandingPageState extends State<DashBoardLandingPage> {
  bool loadingCourses = false,
      loadingCoachApprovals = false,
      loadingNOC = false,
      loadingOrgEvent = false,
      loadingOrgAthleteApplication = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      UserModel currentUser = showEBBF.currentUser;
      return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                InkWell(
                  child: const ProfileCard(
                    title: "Dashboard",
                    image: AppImages.dashboard,
                    loading: false,
                  ),
                  onTap: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(11);
                  },
                ),
                InkWell(
                  child: const ProfileCard(
                    title: "Profile",
                    image: AppImages.profile,
                    loading: false,
                  ),
                  onTap: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(12);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const DashboardProfile()),
                    // );
                  },
                ),
              ],
            ),
            if (currentUser.userType == UserType.UserType_Athlete)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: const ProfileCard(
                      title: "Events",
                      image: AppImages.events,
                      loading: false,
                    ),
                    onTap: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(24);
                    },
                  ),
                  InkWell(
                    child: const ProfileCard(
                      title: "Achievement",
                      image: AppImages.achievement,
                      loading: false,
                    ),
                    onTap: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(10);
                    },
                  ),
                ],
              ),
            if (currentUser.userType == UserType.UserType_Athlete)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: const ProfileCard(
                      title: "Sport Associated",
                      image: AppImages.sportAssociated,
                      loading: false,
                    ),
                    onTap: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(29);
                    },
                  ),
                  InkWell(
                    child: const ProfileCard(
                      title: "Membership",
                      image: AppImages.membership,
                      loading: false,
                    ),
                    onTap: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(28);
                    },
                  ),
                ],
              ),
            if (currentUser.userType == UserType.UserType_Coach)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: ProfileCard(
                        title: "Courses",
                        image: AppImages.coachCourses,
                        loading: loadingCourses),
                    onTap: () {
                      setState(() {
                        loadingCourses = !loadingCourses;
                      });
                      apiServiceHelper(context, APIName.COURSETYPE)
                          .then((value) {
                        setState(() {
                          loadingCourses = !loadingCourses;
                        });
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(33);
                      });
                    },
                  ),
                  InkWell(
                    child: const ProfileCard(
                      title: "Membership",
                      image: AppImages.membership,
                      loading: false,
                    ),
                    onTap: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(28);
                    },
                  ),
                ],
              ),
            if (currentUser.userType == UserType.UserType_Gym_Owner)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: ProfileCard(
                      title: "NOC",
                      image: AppImages.noc,
                      loading: loadingNOC,
                    ),
                    onTap: () async {
                      setState(() {
                        loadingNOC = !loadingNOC;
                      });
                     await apiServiceHelper(context, APIName.NOC).then((value) {
                        setState(() {
                          loadingNOC = !loadingNOC;
                        });
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(36);
                      });
                    },
                  ),
                  InkWell(
                    child: ProfileCard(
                        title: "Coach Approvals",
                        image: AppImages.coachapprovals,
                        loading: loadingCoachApprovals),
                    onTap: () {
                      setState(() {
                        loadingCoachApprovals = !loadingCoachApprovals;
                      });
                      apiServiceHelper(context, APIName.COACHAPPROVAL)
                          .then((value) {
                        setState(() {
                          loadingCoachApprovals = !loadingCoachApprovals;
                        });
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(31);
                      });
                    },
                  ),
                ],
              ),
            if (currentUser.userType == UserType.UserType_Gym_Owner)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: const ProfileCard(
                      title: "Issue/Renew License",
                      image: AppImages.issueRenew,
                      loading: false,
                    ),
                    onTap: () {
                      Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(39);
                    },
                  ),
                  InkWell(
                    child: const ProfileCard(
                      title: "Activities",
                      image: AppImages.activities,
                      loading: false,
                    ),
                    onTap: () async {
                      await apiServiceHelper(context, APIName.GYMACTIVITIESINFO)
                          .then((value) =>
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setNavIndex(32));
                    },
                  ),
                ],
              ),
            //Organizer
            if (currentUser.userType == UserType.UserType_Organized)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: ProfileCard(
                      title: "Events",
                      image: AppImages.events,
                      loading: loadingOrgEvent,
                    ),
                    onTap: () {
                      setState(() {
                        loadingOrgEvent = !loadingOrgEvent;
                      });
                      apiServiceHelper(context, APIName.ORGANIZERUNIQUE)
                          .then((value) {
                        setState(() {
                          loadingOrgEvent = !loadingOrgEvent;
                        });
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(41);
                      });
                    },
                  ),
                  InkWell(
                    child: ProfileCard(
                      title: "Athlete Application",
                      image: AppImages.organizerAthleticApplication,
                      loading: loadingOrgAthleteApplication,
                    ),
                    onTap: () {
                      setState(() {
                        loadingOrgAthleteApplication =
                            !loadingOrgAthleteApplication;
                      });
                      apiServiceHelper(context, APIName.ATHLETEAPPLICATION)
                          .then((value) {
                        setState(() {
                          loadingOrgAthleteApplication =
                              !loadingOrgAthleteApplication;
                        });
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(43);
                      });
                    },
                  ),
                ],
              ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                InkWell(
                  child: const ProfileCard(
                    title: "Change Password",
                    image: AppImages.changePassword,
                    loading: false,
                  ),
                  onTap: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(30);
                  },
                ),
                InkWell(
                  child: const ProfileCard(
                    title: "Logout",
                    image: AppImages.logout,
                    loading: false,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Are you sure"),
                          content: const Text("Do you want to logout?"),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text("Logout"),
                              onPressed: () {
                                deleteSP();
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setProfileData(UserModel());
                                Navigator.pop(context);
                                Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .setNavIndex(0);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ]));
    });
  }
}
