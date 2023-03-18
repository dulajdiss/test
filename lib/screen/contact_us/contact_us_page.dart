import 'package:flutter/material.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/contact_us/widget/card_container.dart';

class ContactUspage extends StatefulWidget {
  const ContactUspage({super.key});

  @override
  State<ContactUspage> createState() => _ContactUspageState();
}

class _ContactUspageState extends State<ContactUspage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                const TitalBox(
                  title: 'CONTACT US',
                  direction: "Home > Contact Us",
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.04,
                ),
                Center(
                  child: Text(
                    "GET IN TOUCH",
                    textAlign: TextAlign.center,
                    style: newsDetailsTextstyle(),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const CardContainer(
                          title: "Visit us on",
                          description: "22nd st-Al TwarAl Twar  \n Dubai UAE",
                          iconData: AppImages.contact_location,
                        ),
                        const CardContainer(
                          title: "Email Us",
                          description: "info@ebbf.ae",
                          iconData: AppImages.contact_email,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const CardContainer(
                          title: "Call Us",
                          description: "+97142393525 ",
                          iconData:AppImages.contact_call_us,
                        ),
                        const CardContainer(
                          title: "Opening Houers",
                          description:
                              "Mon- Fri 8.00 am - 10.00 pm \n Sat 9.00 am - 10.00 pm \n Sun 9.00 am - 17.00 pm",
                          iconData: AppImages.contact_opening_hours,
                        ),
                      ],
                    ),
                    Card(
                      child: Image(
                        image: AppImages.logo,
                        width: (MediaQuery.of(context).size.width) * 0.90,
                        height: (MediaQuery.of(context).size.height) * 0.5,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                )
              ]),

        // ignore: unnecessary_new
        // bottomNavigationBar: BottomNavBarItems(
        //   ontap: (index) {
        //     bottomNavigationLogic(context,index);
        //   },
        // ),
        // endDrawer: const CustomeEndDrower()
    );
  }
}
