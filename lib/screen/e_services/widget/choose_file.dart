import 'package:ebbf/configs/colors.dart';
import 'package:flutter/material.dart';

class ChooseImageFile extends StatelessWidget {
  final title;
  final boxMessage;
  final boxColor;
  final onSelect;
  const ChooseImageFile({Key? key, this.title,this.boxMessage,this.boxColor, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(
          (MediaQuery.of(context).size.width) * 0.02,
        ),
        child: Row(
          children: [
            Expanded(flex: 5, child: Text(title)),
            Expanded(
                flex: 5,
                child: MaterialButton(
                  height: 25,
                  onPressed: onSelect,
                  color:boxColor,
                  child: const Text('Choose File'),
                )),
            Expanded(
                flex: 5,
                child: Padding(
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width) * 0.01,
                    ),
                    child: Text(boxMessage))),
          ],
        ));
  }
}
