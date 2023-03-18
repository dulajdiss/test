import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class RegisterDataFiled extends StatelessWidget {
  final hintText;
  final labelText;
  final validator;
  const RegisterDataFiled(
      {Key? key, this.hintText, this.labelText, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding:  EdgeInsets.all((MediaQuery.of(context).size.width) * 0.02,),
          child: SizedBox(
              width: (MediaQuery.of(context).size.width) * 0.85,
              // height: (MediaQuery.of(context).size.width) * 0.10,
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                    fillColor: AppColors.lightGrey,
                    filled: true,
                    hintText: hintText,
                    labelText: labelText,
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: validator))),
    );
  }
}
