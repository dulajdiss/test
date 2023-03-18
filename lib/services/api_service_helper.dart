// ignore_for_file: use_build_context_synchronously

import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/services/fetch/fetch_achievements_data.dart';
import 'package:ebbf/services/fetch/fetch_athlete_appications.dart';
import 'package:ebbf/services/fetch/fetch_athlete_data.dart';
import 'package:ebbf/services/fetch/fetch_coach_data.dart';
import 'package:ebbf/services/fetch/fetch_coach_need_approval.dart';
import 'package:ebbf/services/fetch/fetch_course_data.dart';
import 'package:ebbf/services/fetch/fetch_coursetype.dart';
import 'package:ebbf/services/fetch/fetch_dashboard_details.dart';
import 'package:ebbf/services/fetch/fetch_eservice.dart';
import 'package:ebbf/services/fetch/fetch_events_data.dart';
import 'package:ebbf/services/fetch/fetch_gender.dart';
import 'package:ebbf/services/fetch/fetch_gym_activities.dart';
import 'package:ebbf/services/fetch/fetch_gym_data.dart';
import 'package:ebbf/services/fetch/fetch_license_types.dart';
import 'package:ebbf/services/fetch/fetch_location.dart';
import 'package:ebbf/services/fetch/fetch_media_data.dart';
import 'package:ebbf/services/fetch/fetch_news_data.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/services/fetch/fetch_noc_list.dart';
import 'package:ebbf/services/fetch/fetch_noc_main_drop.dart';
import 'package:ebbf/services/fetch/fetch_noc_sub_drop.dart';
import 'package:ebbf/services/fetch/fetch_organizer_event.dart';
import 'package:ebbf/services/fetch/fetch_profile_details.dart';
import 'package:ebbf/services/fetch/fetch_sponsors_data.dart';
import 'package:ebbf/services/fetch/fetch_sports_associated.dart';
import 'package:ebbf/services/fetch/fetch_sports_data.dart';
import 'package:ebbf/services/search/fetch_course_drop_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> apiServiceHelper(
    BuildContext context, String variableExpression) async {
  switch (variableExpression) {
    case APIName.ALL:
      {
        // statements;
        await fetchNewsData().then((newsListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchNewsDataNotifire(newsListValue);
          await fetchEventsData().then((eventsListValue) async {
            await Provider.of<EBBFNotifier>(context, listen: false)
                .fetchEventDataNotifire(eventsListValue);
            await fetchGymsData().then((gymListValue) async {
              await Provider.of<EBBFNotifier>(context, listen: false)
                  .fetchGymsDataNotifire(gymListValue);
              await fetchCoachData().then((coachListValue) async {
                await Provider.of<EBBFNotifier>(context, listen: false)
                    .fetchCoachDataNotifire(coachListValue);
                await fetchAthleteData().then((athleteListValue) async {
                  await Provider.of<EBBFNotifier>(context, listen: false)
                      .fetchAthleteDataNotifire(athleteListValue);
                  await fetchSportsData().then((sportsListValue) async {
                    await Provider.of<EBBFNotifier>(context, listen: false)
                        .fetchSportsDataNotifire(sportsListValue);
                    await fetchSponsorsData().then((sponsorsListValue) async {
                      await Provider.of<EBBFNotifier>(context, listen: false)
                          .fetchSponsorsDataNotifire(sponsorsListValue);
                      await fetchMediaData().then((mediaListValue) async {
                        await Provider.of<EBBFNotifier>(context, listen: false)
                            .fetchMediaDataNotifire(mediaListValue);
                        await fetchLocation().then((locationListValue) async {
                          await Provider.of<EBBFNotifier>(context,
                                  listen: false)
                              .fetchLocationNotifire(locationListValue);
                          await fetchGender().then((genderListValue) async {
                            await Provider.of<EBBFNotifier>(context,
                                    listen: false)
                                .fetchGenderNotifire(genderListValue);
                            await fetchCourseDropList()
                                .then((courseDropList) async {
                              await Provider.of<EBBFNotifier>(context,
                                      listen: false)
                                  .fetchCourseDropList(courseDropList);
                              await fetchEServices()
                                  .then((eServicesList) async {
                                await Provider.of<EBBFNotifier>(context,
                                        listen: false)
                                    .fetchEServicesNotifire(eServicesList);
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              });
            });
          });
        });
      }
      break;
    case APIName.AFTERLOGING:
      {
        await fetchAchievements().then((achievementValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchAchievementDataNotifire(achievementValue);
          await fetchDashBoardDetails().then((dashBoardData) async {
            await Provider.of<EBBFNotifier>(context, listen: false)
                .dashboardDataNotifier(dashBoardData);
            await fetchProfileDetails().then((profileData) async {
              await Provider.of<EBBFNotifier>(context, listen: false)
                  .profileDataNotifier(profileData);
              await fetchSportsAssociated().then((sportAssValue) async {
                await Provider.of<EBBFNotifier>(context, listen: false)
                    .fetchSportAssociatedDataNotifire(sportAssValue);
                await fetchLicenseType().then((licenseTypeValues) async {
                  await Provider.of<EBBFNotifier>(context, listen: false)
                      .setLicenseType(licenseTypeValues);
                  //read profile
                  await fetchAthleteApplication()
                      .then((athletAppication) async {
                    await Provider.of<EBBFNotifier>(context, listen: false)
                        .setAthleteAppications(athletAppication);
                    await Provider.of<EBBFNotifier>(context, listen: false)
                        .getProfileData();
                  });
                });
              });
            });
          });
        });
      }
      break;
    case APIName.ORGANIZERUNIQUE:
      {
        await fetchOrganizerEventsData().then((organizerEventData) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchOrganizerEventDataNotifire(organizerEventData!);
        });
        // statements;
      }
      break;

    case APIName.ATHLETEAPPLICATION:
      {
        await fetchAthleteApplication().then((athletAppication) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .setAthleteAppications(athletAppication);
        });
      }
      break;
    case APIName.NOC:
      {
        await fetchNOCMainDrop().then((mainNOC) async {
          await fetchNOCSubDrop().then((subNOC) async {
            await fetchNOCList().then((listNOC) async {
              await Provider.of<EBBFNotifier>(context, listen: false)
                  .fetchNOC(mainNOC, subNOC, listNOC);
            });
          });
        });
      }
      break;
    case APIName.SPONSORS:
      {
        await fetchSponsorsData().then((sponsorsListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchSponsorsDataNotifire(sponsorsListValue);
        });
      }
      break;
    case APIName.EVENTS:
      {
        await fetchEventsData().then((eventsListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchEventDataNotifire(eventsListValue);
        });
      }
      break;

    case APIName.NEWS:
      {
        await fetchNewsData().then((newsListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchNewsDataNotifire(newsListValue);
        });
      }
      break;

    case APIName.ATHLETE:
      {
        await fetchAthleteData().then((athleteListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchAthleteDataNotifire(athleteListValue);
        });
      }
      break;
    case APIName.COACH:
      {
        await fetchCoachData().then((coachListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchCoachDataNotifire(coachListValue);
        });
      }
      break;

    case APIName.MEDIA:
      {
        await fetchMediaData().then((mediaListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchMediaDataNotifire(mediaListValue);
        });
        //statements;
      }
      break;
    case APIName.CONTACTUS:
      {
        // statements;
      }
      break;

    case APIName.GYM:
      {
        await fetchGymsData().then((gymListValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchGymsDataNotifire(gymListValue);
        });
      }
      break;
    case APIName.GYMACTIVITIESINFO:
      {
        await fetchGymActivities().then((gymActivity) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchActivitiesGymsDataNotifire(gymActivity);
        });
      }
      break;

    case APIName.SPORTASSOCIATE:
      {
        await fetchSportsAssociated().then((sportAssociate) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchSportAssociatedDataNotifire(sportAssociate);
        });
      }
      break;
    case APIName.ACHIEVEMENT:
      {
        await fetchAchievements().then((achievementValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchAchievementDataNotifire(achievementValue);
        });
      }
      break;

    case APIName.COACHAPPROVAL:
      {
        await fetchCoachNeedApproval().then((coachNeedApprovalValue) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchCoachNeedApprovalNotifire(coachNeedApprovalValue);
        });
      }
      break;

    case APIName.COURSETYPE:
      {
        await fetchCourseType().then((COURSETYPE) async {
          await Provider.of<EBBFNotifier>(context, listen: false)
              .fetchCourseTypeDataNotifire(COURSETYPE);
          if (COURSETYPE.isNotEmpty) {
            await Provider.of<EBBFNotifier>(context, listen: false)
                .selectedCourseTypeNotifire(COURSETYPE[0]);
            await fetchCourseData("${COURSETYPE[0].ctId}")
                .then((courses) async {
              await Provider.of<EBBFNotifier>(context, listen: false)
                  .fetchCourseDataNotifire(courses);
            });
          }
        });
      }
      break;
    default:
      {
        //statements;
      }
      break;
  }
}
