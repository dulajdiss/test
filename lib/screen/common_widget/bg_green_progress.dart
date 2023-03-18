import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class BGGreenCircularProgress extends StatelessWidget {
  const BGGreenCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.06,
        padding: const EdgeInsets.all(10.0),
        color: AppColors.green,
        child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            )),
      ),
    );
  }
}
