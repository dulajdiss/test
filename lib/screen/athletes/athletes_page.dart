import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/models/athlete_model.dart';
import 'package:ebbf/models/gender_model.dart';
import 'package:ebbf/models/location_module.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/coach/coach_profile.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/events/widget/dropdown_field.dart';
import 'package:ebbf/screen/events/widget/search_bar.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/search/athlete_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AthletesPage extends StatefulWidget {
  const AthletesPage({Key? key}) : super(key: key);

  @override
  State<AthletesPage> createState() => _AthletesPageState();
}

class _AthletesPageState extends State<AthletesPage> {
  String currentGender = "Select Gender";
  String currentGenderId = "Select GenderId";
  List<String>? genderDataList = [];
  String currentSport = "Select Sport";
  String currentSportId = "Select SportId";
  List<String>? sportDataList = [];
  String currentLocation = "Select Location";
  String currentLocationId = "Select LocationId";
  List<String>? locationDataList = [];
  bool loader = false;

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

  setSportList(List<SportsModels> slist) {
    sportDataList = [];
    sportDataList?.add("Select Sport");
    for (int i = 0; i < slist.length; i++) {
      sportDataList?.add(slist[i].title!);
      if (currentSport != "Select Sport") {
        if (currentSport == slist[i].title) {
          currentSportId = slist[i].sId!;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<AthleteModel> athleteList = showEBBF.athleteSearchResult;
      setLocationList(showEBBF.locationList);
      setGenderList(showEBBF.genderList);
      setSportList(showEBBF.sportsListValue);
      return RefreshIndicator(
          onRefresh: () async =>
              await apiServiceHelper(context, APIName.ATHLETE),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                const TitalBox(
                  title: 'ATHLETES',
                  direction: "Home > Athletes",
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.015),
                  child: DropDownField(
                    currentSelectedValue: currentLocation,
                    onChange: (value) {
                      setState(() {
                        currentLocation = value;
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
                      });
                    },
                    dataList: genderDataList,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.015),
                  child: DropDownField(
                    currentSelectedValue: currentSport,
                    onChange: (value) {
                      setState(() {
                        currentSport = value;
                        loader = false;
                      });
                    },
                    dataList: sportDataList,
                  ),
                ),
                SearchBarButton(
                  loader: loader,
                  onPressed: () async {
                    setState(() {
                      loader = !loader;
                    });
                    setLocationList(showEBBF.locationList);
                    setGenderList(showEBBF.genderList);
                    setSportList(showEBBF.sportsListValue);
                    await fetchAthleteSearch(
                            currentLocationId, currentGenderId, currentSportId)
                        .then((value) async {
                      await Provider.of<EBBFNotifier>(context, listen: false)
                          .fetchAthleteSearchResultNotifire(value);
                      setState(() {
                        loader = !loader;
                      });
                    });
                  },
                ),
                for (int i = 0; i < athleteList.length; i += 2)
                  (i + 1 == athleteList.length && athleteList.length % 2 == 1)
                      ? InkWell(
                          child: CoachProfile(
                            coach: athleteList[i],
                          ),
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
                                  child: CoachProfile(
                                    coach: athleteList[i],
                                  ),
                                  onTap: () {
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setNavIndex(35);
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .goCoachDetailsPage(
                                            titleName: 'Athlete',
                                            descriptionName: "Name Of Athlete");
                                  }),
                              InkWell(
                                  child: CoachProfile(
                                    coach: athleteList[i + 1],
                                  ),
                                  onTap: () {
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setNavIndex(35);
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .goCoachDetailsPage(
                                            titleName: 'Athlete',
                                            descriptionName: "Name Of Athlete");
                                  })
                            ]),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.04,
                ),
              ],
            ),
          ));
    });
  }
}
