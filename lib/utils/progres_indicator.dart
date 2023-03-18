import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoProgresIndicator extends StatelessWidget {
  const CupertinoProgresIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 60,
            height: 60,
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 30,
            ),
          ),
        ],
      ),
    );
    //   },
    // );
  }
}

loader(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CupertinoProgresIndicator();
      });
}
