import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class ViewAllAndNextBtn extends StatelessWidget {
  final onPressViewAll;
  const ViewAllAndNextBtn({super.key, this.onPressViewAll});

  @override
  Widget build(BuildContext context) {
    return InkWell(child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'View All',
          style: viewAllTextstyle(),
        ),
        MaterialButton(
          onPressed: onPressViewAll,
          color: AppColors.green,
          textColor: Colors.white,
          // ignore: sort_child_properties_last
          child: const Icon(
            Icons.navigate_next,
          ),
          shape: const CircleBorder(),
        ),
      ],
    ),
      onTap: onPressViewAll,
    );
  }
}
