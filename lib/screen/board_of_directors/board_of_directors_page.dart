import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/screen/board_of_directors/widget/board_member_profile.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/utils/bottomnavigation_logic.dart';
import 'package:flutter/material.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';

class BoardOfDirectorsPage extends StatefulWidget {
  const BoardOfDirectorsPage({super.key});

  @override
  State<BoardOfDirectorsPage> createState() => _BoardOfDirectorsState();
}

class _BoardOfDirectorsState extends State<BoardOfDirectorsPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_constructors
                // ignore: prefer_const_literals_to_create_immutables
                children: [
              // ignore: prefer_const_constructors
              const TitalBox(
                title: 'BOARD OF DIRECTORS',
                direction: "Home > About Us > Board Of Directors",
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.height) * 0.017,
                  ),
                  child: Text(
                    'Board Of Directors',
                    style: bodTitleTextstyle(),
                  ),
                ),
              ),
              const BoardMemberProfile(
                profilePicture: AppImages.director1,
                firstName: "MR.SHEIKH ABDULLAH BIN HAMAD",
                lastName: "BIN SAIF AL SHARIQ",
                position: "Federation President",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.07,
              ),
              const BoardMemberProfile(
                profilePicture: AppImages.director2,
                firstName: "MR.AHMED MOHAMED",
                lastName: "ABDULLA JOWHAR",
                position: "Member-Emirates Powerlifting Committee Chairman",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.07,
              ),
              const BoardMemberProfile(
                profilePicture: AppImages.director3,
                firstName: "MR.FAISAL AHMED ",
                lastName: "OBAID ALZAABI",
                position: "Member-National team &amp; Championships Committee Chairman",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.07,
              ),
              const BoardMemberProfile(
                profilePicture: AppImages.director4,
                firstName: "MR.ALi ABDULLA",
                lastName: "BIN HAIDER",
                position: "Vice President/ Financial Manager ",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.07,
              ),
              const BoardMemberProfile(
                profilePicture: AppImages.director5,
                firstName: "MR.MOHAMMED ABDUL RAHIM",
                lastName: "AL MARRI",
                position: "Secretary General",
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.1,
              ),
            ]) // ignore: unnecessary_new
        // bottomNavigationBar: BottomNavBarItems(
        //   ontap: (index) {
        //     bottomNavigationLogic(context, index);
        //   },
        // ),
        // endDrawer: const CustomeEndDrower()
    );
  }
}
