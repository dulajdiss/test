import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/models/achievements_model.dart';
import 'package:ebbf/models/athlete_model.dart';
import 'package:ebbf/models/coach_model.dart';
import 'package:ebbf/models/course_model.dart';
import 'package:ebbf/models/course_time_model.dart';
import 'package:ebbf/models/course_type.dart';
import 'package:ebbf/models/dashboard_details.dart';
import 'package:ebbf/models/eservices_model.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/models/gender_model.dart';
import 'package:ebbf/models/gym_activities_model.dart';
import 'package:ebbf/models/gyms_model.dart';
import 'package:ebbf/models/license_type_module.dart';
import 'package:ebbf/models/location_module.dart';
import 'package:ebbf/models/media_model.dart';
import 'package:ebbf/models/news_model.dart';
import 'package:ebbf/models/noc_module.dart';
import 'package:ebbf/models/sponsors_model.dart';
import 'package:ebbf/models/sport_associated.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class EBBFNotifier extends ChangeNotifier {
  bool showAboutDropDown = false;
  int selectedIndex = 0,
      previousSelectedIndex = 0,
      homeEventIndex = 0,
      visionMissionSportEventMovingIndex = 0,
      newsDetailsMovingIndex = 0,
      aboutUsLatestNews = 0,
      aboutUsLatestEvent = 0;
  String otpNumber = "",
      selectedEId = "",
      coachDetailsTitleName = "",
      coachDetailsDescriptionName = "";
//DashBoard Details
  late DashBoardDetails dashBoardData;
  late ProfileDetailsModel profileDetails;
  //User Data
  late UserModel currentUser =
      UserModel(userId: null, fullname: null, userType: null);

  //News data fetch
  List<NewsModel> newsListValue = [];
  late NewsModel singleNewsDetails;
  //Event data fetch
  List<EventsModel> eventsListValue = [];
  List<EventsModel> eventsSearchResult = [];
  List<EventsModel> organizerEventsListValue = [];
  String eventFee = "0";
  late EventsModel singleEventDetails;
  //Gym data fetch
  List<GymsModel> gymsListValue = [];
  List<GymsModel> gymsSearchResult = [];
  late GymsModel singleGymDetails;
  List<GymActivityModel> gymsActivityListValue = [];
  late GymActivityModel singleActivityGymDetails;
  //Coach data fetch
  List<CoachModel> coachListValue = [];
  late CoachModel singleCoachDetails;
  List<CoachModel> coachNeedApprovalListValue = [];
  List<CoachModel> coachSearchResult = [];
  //Athlete data fetch
  List<AthleteModel> athleteListValue = [];
  List<AthleteModel> athleteSearchResult = [];
  late AthleteModel singleAthleteDetails;
  //Sports data fetch
  List<SportsModels> sportsListValue = [];
  late SportsModels singleSportDetails;
  //Sponsors data fetch
  List<SponsorsModels> sponsorsListValue = [];
  late SponsorsModels singleSponsorDetails;
  //Media data fetch
  List<MediaModel> mediaListValue = [];
//Achievement data fetch
  List<AchievementsModel> achievementListValue = [];
//Achievement data fetch
  List<SportAssociate> sportAssociateListValue = [];
//COURSE data fetch
  List<CourseType> courseTypeListValue = [];
  CourseType selectedCourseType = CourseType(ctTitle: "");
  List<CourseModel> courseListValue = [];
  List<CourseModel> courseDropList = [];
  List<CourseTimeModel> courseTimeSlotListValue = [];
  List<bool> courseTimeSlotListBoolValue = [];
  //licenseType
  List<LicenseTypeModule> licenseTypeList = [];
  //Athlet Appication
  List<AthleteApplicationModel> athletAppication = [];
  //Location
  List<LocationModule> locationList = [];
  //Gender List
  List<GenderModel> genderList = [];
  //NOC
  List<NOCMainDropModule> nocMainDrop = [];
  List<NOCSubDropModule> nocSubDrop = [];
  List<NOCListModule> nocList = [];
  //Eservice
  List<EServiceModel> eServicesList = [];

  //set navigation button
  setNavIndex(int selectIndex) {
    previousSelectedIndex = selectedIndex;
    selectedIndex = selectIndex;
    notifyListeners();
  }

  getUserData() async {
    notifyListeners();
  }

//About Us
  setAboutDropDownShow(bool val) {
    showAboutDropDown = val;
    notifyListeners();
  }

  setAboutUsLatestNews(int index) {
    aboutUsLatestNews = index;
    notifyListeners();
  }

  setAboutUsLatestEvent(int index) {
    aboutUsLatestEvent = index;
    notifyListeners();
  }

  //set home event moving button
  setHomeEventMovingButton(int selectIndex) {
    homeEventIndex = selectIndex;
    notifyListeners();
  }

  seVisionMissionSportEventMovingButton(int selectIndex) {
    visionMissionSportEventMovingIndex = selectIndex;
    notifyListeners();
  }

  //News related parts
  fetchNewsDataNotifire(List<NewsModel> newsList) {
    newsListValue = newsList;
    notifyListeners();
  }

  setNewsDetails(NewsModel news) {
    singleNewsDetails = news;
    notifyListeners();
  }

  newsDetailsMovingFunction(int selectIndex) {
    newsDetailsMovingIndex = selectIndex;
    notifyListeners();
  }

  //Events related data
  fetchEventDataNotifire(List<EventsModel> eventsList) async {
    print("Event Length: ${eventsList.length}");
    eventsListValue = eventsList;
    eventsSearchResult = eventsList;
    eventFee = await read(SharedPreferencesConstant.eventFee);
    notifyListeners();
  }

  fetchEventSearchResultNotifire(List<EventsModel> evlist) {
    print("Event Search Length: ${evlist.length}");
    if (evlist.length > 1) {
      eventsSearchResult = evlist;
    } else {
      if (evlist[0].eventId != "") {
        eventsSearchResult = evlist;
      }
    }
    notifyListeners();
  }

  fetchOrganizerEventDataNotifire(List<EventsModel> evlist) {
    organizerEventsListValue = [];
    if (evlist.length > 1) {
      organizerEventsListValue = evlist;
    } else {
      if (evlist[0].eId != "") {
        organizerEventsListValue = evlist;
      }
    }
    notifyListeners();
  }

  setEventDetails(EventsModel event) {
    singleEventDetails = event;
    notifyListeners();
  }

  //Gyms related data
  fetchGymsDataNotifire(List<GymsModel> gymsList) {
    gymsListValue = gymsList;
    gymsSearchResult = gymsList;
    notifyListeners();
  }

  fetchActivitiesGymsDataNotifire(List<GymActivityModel> gymsActList) {
    gymsActivityListValue = gymsActList;
    notifyListeners();
  }

  setGymsDetails(GymsModel gyms) {
    singleGymDetails = gyms;
    notifyListeners();
  }

  fetchGymSearchResultNotifire(List<GymsModel> gymList) {
    if (gymList.length == 1) {
      if (gymList[0].title == '') {
        gymsSearchResult = [];
      } else {
        gymsSearchResult = gymList;
      }
    } else {
      gymsSearchResult = gymList;
    }
    notifyListeners();
  }

  //Coach related data
  fetchCoachDataNotifire(List<CoachModel> coachList) {
    coachListValue = coachList;
    coachSearchResult = coachList;
    notifyListeners();
  }

  fetchCoachNeedApprovalNotifire(List<CoachModel> coachList) {
    coachNeedApprovalListValue = coachList;
    notifyListeners();
  }

  setCoachDetails(CoachModel coach) {
    singleCoachDetails = coach;
    notifyListeners();
  }

  //
  goCoachDetailsPage({String? titleName, String? descriptionName}) {
    coachDetailsTitleName = titleName!;
    coachDetailsDescriptionName = descriptionName!;
    notifyListeners();
  }

  fetchCoachSearchResultNotifire(List<CoachModel> coachList) {
    coachSearchResult = coachList;
    notifyListeners();
  }

  //Athlete related data
  fetchAthleteDataNotifire(List<AthleteModel> athleteList) {
    athleteListValue = athleteList;
    athleteSearchResult = athleteList;
    notifyListeners();
  }

  fetchAthleteSearchResultNotifire(List<AthleteModel> athleteList) {
    athleteSearchResult = athleteList;
    notifyListeners();
  }

  setAthleteDetails(AthleteModel athlete) {
    singleAthleteDetails = athlete;
    notifyListeners();
  }

  //Sports related data
  fetchSportsDataNotifire(List<SportsModels> SportsList) {
    sportsListValue = SportsList;
    notifyListeners();
  }

  setSportsDetails(SportsModels sport) {
    singleSportDetails = sport;
    notifyListeners();
  }

  //Sponsors related data
  fetchSponsorsDataNotifire(List<SponsorsModels> sponsorsList) {
    sponsorsListValue = [];
    for (int i = 0; i < sponsorsList.length; i++) {
      if (sponsorsList[i].success == 1) {
        sponsorsListValue.add(sponsorsList[i]);
      }
    }
    notifyListeners();
  }

  setSponsorsDetails(SponsorsModels sponsor) {
    singleSponsorDetails = sponsor;
    notifyListeners();
  }

  //Media related data
  fetchMediaDataNotifire(List<MediaModel> mediaList) {
    sponsorsListValue = [];
    for (int i = 0; i < mediaList.length; i++) {
      if (mediaList[i].success == 1) {
        mediaListValue.add(mediaList[i]);
      }
    }
    notifyListeners();
  }

  //otp related
  setOTPnumber(String otp) {
    otpNumber = otp;
    notifyListeners();
  }

  //user related
  setProfileData(UserModel user) {
    currentUser = user;
    saveUserData(user);
    notifyListeners();
  }

  getProfileData() {
    read(SharedPreferencesConstant.confirmUser).then((value) {
      if (value != null) {
        readUserData().then((user) {
          currentUser = user;
        });
      }
    });
    notifyListeners();
  }

  //Achieveint related data
  fetchAchievementDataNotifire(List<AchievementsModel> achiList) {
    achievementListValue = achiList;
    notifyListeners();
  }

  //Sport associated related data
  fetchSportAssociatedDataNotifire(List<SportAssociate> sportAssList) {
    if (sportAssList.length == 1) {
      if (sportAssList[0].title == null) {
        sportAssociateListValue = [];
      } else {
        sportAssociateListValue = sportAssList;
      }
    } else {
      sportAssociateListValue = sportAssList;
    }
    notifyListeners();
  }

  //Course related data
  fetchCourseTypeDataNotifire(List<CourseType> courseTypeList) {
    courseTypeListValue = courseTypeList;
    notifyListeners();
  }

  selectedCourseTypeNotifire(CourseType courseType) {
    selectedCourseType = courseType;
    notifyListeners();
  }

  fetchCourseDataNotifire(List<CourseModel> courseList) {
    courseListValue = courseList;
    notifyListeners();
  }

  fetchCourseTimeSlotDataNotifire(List<CourseTimeModel> courseTimeList) {
    courseTimeSlotListValue = courseTimeList;
    courseTimeSlotListBoolValue = [];
    for (int i = 0; i < courseTimeList[0].courseslots!.length; i++) {
      courseTimeSlotListBoolValue.add(false);
    }
    notifyListeners();
  }

  setCourseTimeSlotListBoolValue(List<bool> val) {
    courseTimeSlotListBoolValue = val;
    notifyListeners();
  }

  setSelectedCourse() {
    notifyListeners();
  }

  dashboardDataNotifier(DashBoardDetails dashBoardDataTMP) {
    dashBoardData = dashBoardDataTMP;
    notifyListeners();
  }

  profileDataNotifier(ProfileDetailsModel pfDataTMP) {
    profileDetails = pfDataTMP;
    notifyListeners();
  }

  setLicenseType(List<LicenseTypeModule> ltm) {
    licenseTypeList = ltm;
    notifyListeners();
  }

  setSelectedEID(String eId) {
    selectedEId = eId;
    notifyListeners();
  }

  setAthleteAppications(List<AthleteApplicationModel> tmpAA) {
    if (tmpAA.length == 1) {
      if (tmpAA[0].eventName == '') {
        athletAppication = [];
      } else {
        athletAppication = tmpAA;
      }
    } else {
      athletAppication = tmpAA;
    }
    notifyListeners();
  }

  fetchLocationNotifire(List<LocationModule> lmList) {
    locationList = lmList;
    notifyListeners();
  }

  fetchNOC(List<NOCMainDropModule> nocMain, List<NOCSubDropModule> nocSub,
      List<NOCListModule> noc) {
    nocMainDrop = nocMain;
    nocSubDrop = nocSub;
    nocList = noc;
    notifyListeners();
  }

  fetchGenderNotifire(List<GenderModel> gnList) {
    genderList = gnList;
    notifyListeners();
  }

  fetchCourseDropList(List<CourseModel> cmList) {
    courseDropList = cmList;
    notifyListeners();
  }

  fetchEServicesNotifire(List<EServiceModel> tmpeServicesList) {
    eServicesList = tmpeServicesList;
    notifyListeners();
  }
}
