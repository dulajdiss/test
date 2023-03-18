import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class SquerBoxWithDropDown extends StatelessWidget {
  final onChange;
  final List<String>? dataList;
  final currentSelectedValue;
  const SquerBoxWithDropDown(
      {super.key, this.onChange, this.dataList, this.currentSelectedValue});
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: (MediaQuery.of(context).size.width) * 0.12,
            padding: const EdgeInsets.all(3),
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.zero,
              color: AppColors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                // isExpanded: true,
                value: currentSelectedValue,
                iconEnabledColor: AppColors.black,
                iconSize: 20,
                // isDense: true,
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.width) * 0.036,
                    color: AppColors.black),
                onChanged: onChange,
                items: dataList!.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          // ),
        );
      },
    );
  }
}
