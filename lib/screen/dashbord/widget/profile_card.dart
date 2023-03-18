import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  final image;
  final title;
  final loading;
  const ProfileCard({super.key, this.image, this.title, this.loading});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width) * 0.47,
        height: (MediaQuery.of(context).size.height) * 0.186,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Image(
                image: image,
                width: (MediaQuery.of(context).size.width) * 0.80,
                fit: BoxFit.contain,
              )),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.004,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                child: FittedBox(
                  child: Text(
                    "$title",
                    style: countactUsGridTextstyle(),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.004,
              ),
            ],
          ),
          if (loading) const Center(child: CircularProgressIndicator(color: AppColors.white,)),
          if (loading)
            Container(
              color: AppColors.grey.withOpacity(0.3),
            )
        ]),
      ),
    );
  }
}
