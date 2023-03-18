import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class SearchBarButton extends StatelessWidget {
  final onPressed;
  final loader;
  const SearchBarButton({super.key, this.loader, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: (MediaQuery.of(context).size.height) * 0.055,
        color: AppColors.green,
        child: Center(
            child: loader
                ? SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.03,
                    width: (MediaQuery.of(context).size.height) * 0.03,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.white,
                    ))),
      ),
    );
  }
}
