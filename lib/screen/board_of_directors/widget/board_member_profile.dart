import 'package:ebbf/configs/colors.dart';
import 'package:ebbf/configs/images.dart';
import 'package:ebbf/configs/text_style.dart';
import 'package:flutter/material.dart';

class BoardMemberProfile extends StatelessWidget {
  final firstName;
  final lastName;
  final position;
  final profilePicture;
  const BoardMemberProfile({Key? key, this.firstName, this.lastName, this.position, this.profilePicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: (MediaQuery.of(context).size.height) * 0.07,
            ),
            child: Center(
              child: Image(
                image: profilePicture,
                width: (MediaQuery.of(context).size.width) * 0.90,
                height: (MediaQuery.of(context).size.height) * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            // ),
          ),
          Container(
            color: AppColors.green,
            width: (MediaQuery.of(context).size.width) * 0.84,
            height: (MediaQuery.of(context).size.height) * 0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$firstName',
                    style: directorNameTextstyle()),
                Text('$lastName',
                    style: directorNameTextstyle()),
                Text('$position',
                    textAlign: TextAlign.center,
                    style: directorPositionTextstyle()),
              ],
            ),
          )
        ],
      );
  }
}
