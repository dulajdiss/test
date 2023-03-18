import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/bottom_nav_bar.dart';
import 'package:ebbf/screen/common_widget/end_drower.dart';
import 'package:ebbf/screen/common_widget/header_widget.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:ebbf/screen/home/home.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final onChange;
  final List<String>? dataList;
  final currentSelectedValue;
  const DropDownField(
      {super.key, this.onChange, this.dataList, this.currentSelectedValue});
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            // labelStyle: textStyle,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.green, width: 1.0),
            ),
            errorStyle:
                const TextStyle(color: Colors.redAccent, fontSize: 10.0),
            hintText: 'Please select expense',
            prefixIconColor: AppColors.green,
            contentPadding: EdgeInsets.only(bottom: -5, left:  (MediaQuery.of(context).size.width) * 0.02),
          ),
          isEmpty: currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: currentSelectedValue,
              iconEnabledColor: AppColors.green,
              style: dropdownTextstyle(),
              iconSize: 20,
              isDense: true,
              onChanged: onChange,
              items: dataList!.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
