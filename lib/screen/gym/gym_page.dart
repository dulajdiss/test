import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/models/gender_model.dart';
import 'package:ebbf/models/gyms_model.dart';
import 'package:ebbf/models/location_module.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/events/widget/dropdown_field.dart';
import 'package:ebbf/screen/events/widget/search_bar.dart';
import 'package:ebbf/screen/gym/gym_profile.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/search/gym_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GymPage extends StatefulWidget {
  const GymPage({super.key});

  @override
  State<GymPage> createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> {
  bool loader = false;
  String currentLocation = "Select Location";
  String currentLocationId = "Select LocationId";
  List<String>? locationDataList = [];
  String az = "Select A-Z";
  List<String>? azDataList = [];
  String gender = "Select Gender";
  String currentGenderId = "Select GenderId";
  List<String>? genderDataList = [];
  List<String>? keyWordDataList = [];
  TextEditingController keyWordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    azDataList?.add("Select A-Z");
    azDataList?.add("Select Z-A");
    keyWordDataList?.add("Select KeyWord");
    super.initState();
  }

  setGenderList(List<GenderModel> glist) {
    genderDataList = [];
    genderDataList?.add("Select Gender");
    for (int i = 0; i < glist.length; i++) {
      genderDataList?.add(glist[i].genderTitle!);
      if (gender != "Select Gender") {
        if (gender == glist[i].genderTitle) {
          currentGenderId = glist[i].genderId!;
        }
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<GymsModel> gymList = showEBBF.gymsSearchResult;
      setGenderList(showEBBF.genderList);
      setLocationList(showEBBF.locationList);
      return RefreshIndicator(
          onRefresh: () async => await apiServiceHelper(context, APIName.GYM),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                const TitalBox(
                  title: 'GYMS',
                  direction: "Home > Gyms",
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
                    (MediaQuery.of(context).size.width) * 0.015,
                  ),
                  child: DropDownField(
                    currentSelectedValue: gender,
                    onChange: (value) {
                      setState(() {
                        gender = value;
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
                    currentSelectedValue: az,
                    onChange: (value) {
                      setState(() {
                        az = value;
                        loader = false;
                      });
                    },
                    dataList: azDataList,
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
                        hintText: "Keyword",
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
                    setGenderList(showEBBF.genderList);
                    setLocationList(showEBBF.locationList);
                    String azId = az == "Select A-Z" ? '0' : '1';
                    await fetchGymsSearch(keyWordController.text,
                            currentLocationId, currentGenderId, azId)
                        .then((value) async {
                      await Provider.of<EBBFNotifier>(context, listen: false)
                          .fetchGymSearchResultNotifire(value);
                      setState(() {
                        loader = !loader;
                      });
                    });
                  },
                ),
                for (int i = 0; i < gymList.length; i += 2)
                  (i + 1 == gymList.length && gymList.length % 2 == 1)
                      ? InkWell(
                          child: GymProfile(gymData: gymList[i]),
                          onTap: () {
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setNavIndex(21);
                            Provider.of<EBBFNotifier>(context, listen: false)
                                .setGymsDetails(gymList[i]);
                          })
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              InkWell(
                                  child: GymProfile(gymData: gymList[i]),
                                  onTap: () {
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setNavIndex(21);
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setGymsDetails(gymList[i]);
                                  }),
                              InkWell(
                                  child: GymProfile(gymData: gymList[i + 1]),
                                  onTap: () {
                                    // fetchGymsInfoData(gymList[i].gymId.toString())
                                    //     .then((gymInfo) {
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setNavIndex(21);
                                    Provider.of<EBBFNotifier>(context,
                                            listen: false)
                                        .setGymsDetails(gymList[i]);
                                    // });
                                  }),
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
