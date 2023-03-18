import 'package:ebbf/configs/images.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width) * 0.05,
          bottom: (MediaQuery.of(context).size.width) * 0.02,
          top: (MediaQuery.of(context).size.width) * 0.05,
          right: (MediaQuery.of(context).size.width) * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
                child: Image(
                  image: AppImages.logo,
                  width: (MediaQuery.of(context).size.width) * 0.60,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(0);
                }),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
                child: Image(
                  image: AppImages.logo2,
                  width: (MediaQuery.of(context).size.width) * 0.60,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  Provider.of<EBBFNotifier>(context, listen: false)
                      .setNavIndex(0);
                }),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.list_rounded,
                        size: 40,
                      ))))
        ],
      ),
    );
  }
}
