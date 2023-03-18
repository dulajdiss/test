import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class IssuingNOCForCoach extends StatelessWidget {
  final currentCodeSelectedValue;
  final onChange;
  final color;
  const IssuingNOCForCoach({
    Key? key,
    this.currentCodeSelectedValue,
    this.onChange,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: onChange,
            child: Container(
                color: AppColors.black,
                width: (MediaQuery.of(context).size.width) * 0.90,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width) * 0.04,
                      left: (MediaQuery.of(context).size.width) * 0.05,
                      right: (MediaQuery.of(context).size.width) * 0.05,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:
                                (MediaQuery.of(context).size.height) * 0.025,
                            child: AutoSizeText(
                              currentCodeSelectedValue,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width) *
                                          0.03,
                                  color: color),
                            ),
                          ),
                          const Center(
                              child: Divider(
                            thickness: 1,
                            color: AppColors.grey,
                          ))
                        ])))));
    // SizedBox(
    //     width: (MediaQuery.of(context).size.width) * 0.425,
    //     child: Text("Document",
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: (MediaQuery.of(context).size.width) * 0.035,
    //         ))),
    // Padding(
    //     padding: EdgeInsets.only(
    //       top: (MediaQuery.of(context).size.width) * 0.025,
    //       bottom: (MediaQuery.of(context).size.width) * 0.025,
    //     ),
    //     child: Container(
    //       height: (MediaQuery.of(context).size.width) * 0.1,
    //       width: (MediaQuery.of(context).size.width) * 0.98,
    //       padding: const EdgeInsets.all(3),
    //       // ignore: prefer_const_constructors
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           width: 1,
    //         ),
    //         borderRadius: BorderRadius.zero,
    //         color: AppColors.white,
    //       ),
    //       child: DropdownButtonHideUnderline(
    //         child: DropdownButton<String>(
    //           // isExpanded: true,
    //           value: currentDocumentSelectedValue,
    //           iconEnabledColor: AppColors.black,
    //           iconSize: 20,
    //           // isDense: true,
    //           style: TextStyle(
    //               fontSize: (MediaQuery.of(context).size.width) * 0.036,
    //               color: AppColors.black),
    //           onChanged: onChangeDocument,
    //           items: dataDocumentList!.map((String value) {
    //             return DropdownMenuItem<String>(
    //               value: value,
    //               child: Text(value),
    //             );
    //           }).toList(),
    //         ),
    //       ),
    //     // )),
    //   ],
    // )
    // );
  }
}
