import 'package:flutter/material.dart';
import 'package:ebbf/configs/colors.dart';

class CheckBoxWithText extends StatelessWidget {
  final value;
  final title;
  final onChnage;
  const CheckBoxWithText({Key? key, this.value, this.title, this.onChnage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:(MediaQuery.of(context).size.height) * 0.05 ,
      child: CheckboxListTile(
        selectedTileColor: Colors.white,
        checkColor: Colors.white,
        activeColor: AppColors.green,
        shape: const CircleBorder(),
        checkboxShape: const CircleBorder(),
        // activeColor: Colors.transparent,
        value: value,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: onChnage,
        title: Text(
          title.toString(),
          style: TextStyle(
              fontSize: (MediaQuery.of(context).size.width) * 0.0275,
              color: AppColors.white),
        ),
      ),
    );
  }
}
