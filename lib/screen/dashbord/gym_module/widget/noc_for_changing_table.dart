// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/models/noc_module.dart';
import 'package:ebbf/utils/file_downloader.dart';
import 'package:flutter/material.dart';

class NOCForChangingTable extends StatelessWidget {
  final List<NOCListModule> nocList;
  const NOCForChangingTable({Key? key, required this.nocList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColors.grey, width: 1.5),
      columnWidths: const {
        0: FlexColumnWidth(2.2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(children: [
          Padding(
              padding: EdgeInsets.all(
                (MediaQuery.of(context).size.width) * 0.03,
              ),
              child: const Text(
                "File name",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.all(
                (MediaQuery.of(context).size.width) * 0.03,
              ),
              child: const Text(
                "Issue date",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.all(
                (MediaQuery.of(context).size.width) * 0.03,
              ),
              child: const Text(
                "Download",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )),
        ]),
        for (int i = 0; i < nocList.length; i++)
          TableRow(children: [
            Padding(
                padding: EdgeInsets.all(
                  (MediaQuery.of(context).size.width) * 0.03,
                ),
                child: Text(
                  nocList[i].fileName!,
                  style: TextStyle(fontSize: 15.0),
                )),
            Padding(
                padding: EdgeInsets.all(
                  (MediaQuery.of(context).size.width) * 0.03,
                ),
                child: Text(
                  nocList[i].issueDate!,
                  style: TextStyle(fontSize: 15.0),
                )),
            Padding(
              padding: EdgeInsets.all(
                (MediaQuery.of(context).size.width) * 0.02,
              ),
              child: InkWell(
                  child: Container(
                    color: AppColors.green,
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.01,
                    ),
                    child: const Text(
                      "Download",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.0, color: AppColors.white),
                    ),
                  ),
                  onTap: () {
                    loadPdfFromNetwork(nocList[i].coach!);
                  }),
            ),
          ]),
      ],
    );
  }
}
