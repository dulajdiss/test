import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/models/events_models.dart';
import 'package:ebbf/models/gender_model.dart';
import 'package:ebbf/models/location_module.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/events/singal_event_details.dart';
import 'package:ebbf/screen/events/widget/dropdown_field.dart';
import 'package:ebbf/screen/events/widget/event_body.dart';
import 'package:ebbf/screen/events/widget/search_bar.dart';
import 'package:ebbf/screen/coach/coach_page.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/search/event_search.dart';
import 'package:ebbf/utils/bottomnavigation_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String currentEvent = "Select Event";
  String currentEventId = "Select EventId";
  List<String>? eventDataList = [];
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

  setEventsList(List<EventsModel> elist) {
    eventDataList = [];
    eventDataList?.add("Select Event");
    for (int i = 0; i < elist.length; i++) {
      eventDataList?.add(elist[i].title!);
      if (currentEvent != "Select Event") {
        if (currentEvent == elist[i].title) {
          currentEventId = elist[i].eventId!;
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
      List<EventsModel> eventsList = showEBBF.eventsSearchResult;
      setLocationList(showEBBF.locationList);
      setEventsList(showEBBF.eventsListValue);
      setSportList(showEBBF.sportsListValue);
      return RefreshIndicator(
          onRefresh: () async =>
              await apiServiceHelper(context, APIName.EVENTS),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                const TitalBox(
                  title: 'EVENTS',
                  direction: "Home > Events",
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropDownField(
                    currentSelectedValue: currentEvent,
                    onChange: (value) {
                      setState(() {
                        currentEvent = value;
                        loader = false;
                      });
                    },
                    dataList: eventDataList,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
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
                  padding: const EdgeInsets.all(4.0),
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
                      setLocationList(showEBBF.locationList);
                      setEventsList(showEBBF.eventsListValue);
                      setSportList(showEBBF.sportsListValue);
                    });
                    await fetchEventsSearch(
                            currentLocationId, currentEventId, currentSportId)
                        .then((value) async {
                      await Provider.of<EBBFNotifier>(context, listen: false)
                          .fetchEventSearchResultNotifire(value);
                      setState(() {
                        loader = !loader;
                      });
                    });
                  },
                ),
                for (int i = 0; i < eventsList.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height) * 0.02,
                    ),
                    child: EventBody(
                        eventDetails: eventsList[i],
                        onPressReadMore: () {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .setNavIndex(20);
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .setEventDetails(eventsList[i]);
                        }),
                  ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.04,
                ),
              ],
            ),
          ));
    });
  }
}
