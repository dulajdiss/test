import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/models/sports_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SportCards extends StatelessWidget {
  final SportsModels sportData;
  const SportCards({super.key, required this.sportData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height) * 0.5,
        width: (MediaQuery.of(context).size.width) * 0.89,
        child: Card(
            color: AppColors.lightGrey,
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.20,
                      width: (MediaQuery.of(context).size.width) * 0.88,
                      color: AppColors.white,
                      child: Center(
                        child: AutoSizeText(
                          sportData.title.toString(),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  child: Text(
                    sportData.description.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  child: Center(
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Read More',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            color: AppColors.green,
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setNavIndex(22);
                        Provider.of<EBBFNotifier>(context, listen: false)
                            .setSportsDetails(sportData);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const SportDetailsPage()),
                        // );
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
