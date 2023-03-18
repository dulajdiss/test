import 'package:ebbf/models/media_model.dart';
import 'package:ebbf/notifire/ebbf_notifire.dart';
import 'package:ebbf/screen/common_widget/title_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EBBFNotifier>(builder: (context, showEBBF, _) {
      List<MediaModel> entities = showEBBF.mediaListValue;
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_constructors
                // ignore: prefer_const_literals_to_create_immutables
                children: [
              // ignore: prefer_const_constructors
              TitalBox(
                title: 'MEDIA',
                direction: "Home > Media",
              ),

              for (int i = 0; i < entities.length; i++)
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.network(entities[i].pic.toString())))
            ])), // ignore: unnecessary_new
      );
    });
  }
}
