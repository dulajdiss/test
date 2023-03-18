import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/models/dashboard_details.dart';
import 'package:flutter/material.dart';

class DashBoardDetailsTableRow extends StatelessWidget {
  final DashBoardDetails dbDetails;
  const DashBoardDetailsTableRow({Key? key,required this.dbDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.symmetric(
          inside: const BorderSide(width: 2, color: AppColors.white),
        ),
        children: [
          TableRow(
            children: [
              TableCell(
                  // verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.center,
                      color: AppColors.green,
                      child: const Text('Years of establishment',
                          style: TextStyle(color: AppColors.white)))),
              TableCell(
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width) *
                              0.02,
                      color: Colors.grey[300],
                      child: Text(dbDetails.established!))),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  // verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.center,
                      color: AppColors.green,
                      child: const Text('Owner name',
                          style: TextStyle(color: AppColors.white)))),
              TableCell(
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width) *
                              0.02,
                      color: Colors.grey[300],
                      child: Text(dbDetails.ownerName!))),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  // verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.center,
                      color: AppColors.green,
                      child: const Text('Location map',
                          style: TextStyle(color: AppColors.white)))),
              TableCell(
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width) *
                              0.02,
                      color: Colors.grey[300],
                      child: Text(dbDetails.location!))),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  // verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.center,
                      color: AppColors.green,
                      child: const Text('Working Hours',
                          style: TextStyle(color: AppColors.white)))),
              TableCell(
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width) *
                              0.02,
                      color: Colors.grey[300],
                      child: Text(dbDetails.workingHours!))),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  // verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.center,
                      color: AppColors.green,
                      child: const Text('Number of coaches',
                          style: TextStyle(color: AppColors.white)))),
              TableCell(
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width) *
                              0.02,
                      color: Colors.grey[300],
                      child: Text(dbDetails.noofcoaches!))),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  // verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.center,
                      color: AppColors.green,
                      child: const Text(
                        'Contact number',
                        style: TextStyle(color: AppColors.white),
                      ))),
              TableCell(
                  child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.05,
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width) *
                              0.02,
                      color: Colors.grey[300],
                      child: Text(dbDetails.contactNumber!))),
            ],
          ),
        ]);
  }
}
