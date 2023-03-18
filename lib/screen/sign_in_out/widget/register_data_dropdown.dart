import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class RegisterDataDropDown extends StatelessWidget {
  final onChange;
  final List<String>? dataList;
  final currentSelectedValue;
  const RegisterDataDropDown(
      {super.key, this.onChange, this.dataList, this.currentSelectedValue});
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.85,
            // height: (MediaQuery.of(context).size.width) * 0.10,
            child: InputDecorator(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(29.0),
                ),
                fillColor: AppColors.lightGrey,
                filled: true,
              ),
              isEmpty: currentSelectedValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: currentSelectedValue,
                  iconEnabledColor: AppColors.black,
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
            ),
          ),
        );
      },
    );
  }
}
