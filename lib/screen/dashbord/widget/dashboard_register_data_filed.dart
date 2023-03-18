import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class DashBoardRegisterDataFiled extends StatelessWidget {
  final labelText;
  final validator;
  final hintext;
  final controller;
  const DashBoardRegisterDataFiled(
      {Key? key, this.hintext, this.labelText, this.controller, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(
            (MediaQuery.of(context).size.width) * 0.01,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (labelText != null)
                  Padding(
                      padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width) * 0.05,
                      ),
                      child: Text(labelText)),
                Padding(
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.01,
                    ),
                    child: SizedBox(
                        width: (MediaQuery.of(context).size.width) * 0.85,
                        // height: (MediaQuery.of(context).size.width) * 0.10,
                        child: TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                              fillColor: AppColors.lightGrey,
                              filled: true,
                              hintText: hintext ?? "",
                            ),
                            onSaved: (String? value) {},
                            validator: validator)))
              ])),
    );
  }
}
