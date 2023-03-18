import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/models/user_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomeEndDrower extends StatelessWidget {
  const CustomeEndDrower({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      bool showAboutDropDown = showEBBF.showAboutDropDown;
      return Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Padding(
                  padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.height) * 0.025),
                  child: ListTile(
                    trailing: Image(
                      image: AppImages.enddrowerclose,
                      width: (MediaQuery.of(context).size.width) * 0.10,
                      height: (MediaQuery.of(context).size.height) * 0.10,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
              ListTile(
                // leading: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(0);
                },
              ),
              ListTile(
                title: Text(
                  "E-Services",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(37);
                },
              ),
              ListTile(
                // leading: Icon(Icons.account_box),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About Us",
                        style: endDrowerTextStyle(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right:
                                (MediaQuery.of(context).size.height) * 0.025),
                        child: Container(
                          color: AppColors.green,
                          width: (MediaQuery.of(context).size.width) * 0.10,
                          height: (MediaQuery.of(context).size.width) * 0.10,
                          child: IconButton(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () {
                              Provider.of<EBBFNotifier>(context, listen: false)
                                  .setAboutDropDownShow(!showAboutDropDown);
                            },
                          ),
                        ),
                      )
                    ]),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(6);
                },
              ),
              if (showAboutDropDown)
                ListTile(
                  // leading: Icon(Icons.grid_3x3_outlined),
                  title: Text(
                    "   Message from the President",
                    style: endDrowerAboutSubTextStyle(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(15);
                  },
                ),
              if (showAboutDropDown)
                ListTile(
                  // leading: Icon(Icons.grid_3x3_outlined),
                  title: Text(
                    "   Board of Directors",
                    style: endDrowerAboutSubTextStyle(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(7);
                  },
                ),
              if (showAboutDropDown)
                ListTile(
                  title: Text(
                    "   Vision & Mission",
                    style: endDrowerAboutSubTextStyle(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(18);
                  },
                ),
              if (showAboutDropDown)
                ListTile(
                  title: Text(
                    "   Sports",
                    style: endDrowerAboutSubTextStyle(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<EBBFNotifier>(context, listen: false)
                        .setNavIndex(5);
                  },
                ),
              ListTile(
                title: Text(
                  "Events",
                  style: endDrowerTextStyle(),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  // await Provider.of<EBBFNotifier>(context, listen: false)
                  //     .fetchEventDataNotifire(showEBBF.eventsListValue);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(13);
                },
              ),
              ListTile(
                title: Text(
                  "News",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(14);
                },
              ),
              ListTile(
                title: Text(
                  "Coach",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(2);
                },
              ),
              ListTile(
                title: Text(
                  "Gym",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(1);
                },
              ),
              ListTile(
                title: Text(
                  "Athlete",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(3);
                },
              ),
              ListTile(
                title: Text(
                  "Media",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(23);
                },
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(8);
                },
              ),
              ListTile(
                title: Text(
                  showEBBF.currentUser.userId == null ? "Login" : "Logout",
                  style: endDrowerTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showEBBF.currentUser.userId == null
                      ? Provider.of<EBBFNotifier>(context, listen: false)
                          .setNavIndex(17)
                      : showDialog(
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
        ),
      );
    });
  }
}
