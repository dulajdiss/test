import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/constants.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bg_green_button.dart';
import 'package:ebbf/screen/common_widget/bg_green_progress.dart';
import 'package:ebbf/screen/common_widget/title_box_with_back_button.dart';
import 'package:ebbf/screen/sign_in_out/widget/register_data_dropdown.dart';
import 'package:ebbf/services/api_service_helper.dart';
import 'package:ebbf/services/fetch/fetch_add_sport_associated.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

class AddSportAssociated extends StatefulWidget {
  const AddSportAssociated({Key? key}) : super(key: key);

  @override
  State<AddSportAssociated> createState() => _AddSportAssociatedState();
}

class _AddSportAssociatedState extends State<AddSportAssociated> {
  // String selectedSportName = "Select Name";
  List<String> sportDataList = [];
  List<String> selected = [];
  List<String> sportIDList = [];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<SportsModels> sportList = showEBBF.sportsListValue;
      sportDataList = [];
      sportDataList.add('Select Sport Name');
      sportIDList = [];
      sportIDList.add('Select Sport Name');
      for (int j = 0; j < sportList.length; j++) {
        sportDataList.add(sportList[j].title.toString());
        sportIDList.add(sportList[j].sId.toString());
      }
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // ignore: prefer_const_constructors
              Stack(children: [
                TitalBoxWithBackButton(
                  title: 'DASHBOARD',
                  direction: "Home > Dashboard > \nAdd SportAssociated",
                  onPress: () {
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(showEBBF.previousSelectedIndex);
                  },
                ),
                Positioned(
                    top: (MediaQuery.of(context).size.height) * 0.02,
                    left: (MediaQuery.of(context).size.width) * 0.40,
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.94,
                      height: (MediaQuery.of(context).size.height) * 0.08,
                      child: Image(
                        image: AppImages.dashboarddetailimage,
                        width: (MediaQuery.of(context).size.width) * 0.80,
                        fit: BoxFit.contain,
                      ),
                    )),
                Positioned(
                    top: (MediaQuery.of(context).size.height) * 0.099,
                    left: (MediaQuery.of(context).size.width) * 0.77,
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.22,
                      height: (MediaQuery.of(context).size.height) * 0.08,
                      child: AutoSizeText(
                        "Hi ${showEBBF.currentUser.fullname} !",
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ]),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width) * 0.80,
                  child:
                      Text("Sport Name *", style: profileUserNameTextstyle())),

              // SizedBox(
              //     width: (MediaQuery.of(context).size.width) * 0.80,
              //     child: DropDownMultiSelect(
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(29.0),
              //         ),
              //         fillColor: AppColors.grey,
              //       ),
              //       onChanged: (List<String> x) {
              //         setState(() {
              //           selected = x;
              //         });
              //       },
              //       options: sportDataList,
              //       selectedValues: selected,
              //       whenEmpty: 'Select Sport Name',
              //     )),
              SizedBox(
                width: (MediaQuery.of(context).size.width) * 0.80,
                child: RegisterDataDropDown(
                  currentSelectedValue: "Select Sport Name",
                  onChange: (value) {
                    setState(() {
                      // selectedSportName = value;
                      if (value != "Select Sport Name") {
                        selected.add(value);
                        List<String> distinctIds = selected.toSet().toList();
                        selected = distinctIds;
                      }
                    });
                  },
                  dataList: sportDataList,
                ),
              ),
              if (selected.isNotEmpty)
                SizedBox(
                    width: (MediaQuery.of(context).size.width) * 0.80,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.width) * 0.02,
                          bottom: (MediaQuery.of(context).size.width) * 0.02,
                        ),
                        child: Text(
                          "Selected Sports *",
                          style: profileUserNameTextstyle(),
                        ))),
              for (int i = 0; i < selected.length; i++)
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.78,
                  height: (MediaQuery.of(context).size.height) * 0.05,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width) * 0.04,
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selected[i],
                                  style: addSportAssoSelectList(),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        selected.removeAt(i);
                                      });
                                    },
                                    icon: Icon(Icons.delete))
                              ]))),
                ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.04,
              ),
              loading
                  ? const BGGreenCircularProgress()
                  : BGGreenButton(
                      title: "SUBMIT",
                      onPressed: () async {
                        String sportIDs = '';
                        setState(() {
                          loading = !loading;
                        });
                        for (int i = 0; i < sportDataList.length; i++) {
                          for (String element in selected) {
                            if (sportDataList[i] == element) {
                              if (sportIDs == "") {
                                sportIDs = sportIDList[i];
                              } else {
                                sportIDs = '$sportIDs,${sportIDList[i]}';
                              }
                            }
                          }
                        }
                        await fetchAddSportsAssociated(sportIDs);
                        await apiServiceHelper(context, APIName.SPORTASSOCIATE)
                            .then((value) {
                          Provider.of<EBBFNotifier>(context, listen: false)
                              .setNavIndex(showEBBF.previousSelectedIndex);
                          setState(() {
                            loading = !loading;
                          });
                        });
                      },
                    )
            ])),
      );
    });
  }
}
