import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class LinerProgressIndicator extends StatefulWidget {
  const LinerProgressIndicator({super.key});

  @override
  State<LinerProgressIndicator> createState() => _LinerProgressIndicatorState();
}

class _LinerProgressIndicatorState extends State<LinerProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: (MediaQuery.of(context).size.width) * 0.75,
          height: (MediaQuery.of(context).size.height) * 0.02,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: controller.value,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.splashLinerProgress),
              backgroundColor: AppColors.splashLinerProgressBG,
            ),
          ),
        ),
      ),
    );
  }
}
