import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class BGGreenButton extends StatelessWidget {
  final title;
  final onPressed;
  const BGGreenButton({super.key, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.height*0.07,
        color: AppColors.green,
        child: MaterialButton(
          // color: AppColors.green,
          textColor: AppColors.white,
          onPressed: onPressed,
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}


