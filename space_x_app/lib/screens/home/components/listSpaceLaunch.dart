import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:space_x_app/repository/SpaceX.dart';
import 'package:space_x_app/screens/home/components/spaceCardModel.dart';

class ListSpaceLaunch extends StatefulWidget {

  List<SpaceXServiceApi> lstSpace;

  ListSpaceLaunch(this.lstSpace);
  @override
  State<ListSpaceLaunch> createState() => _ListSpaceLaunchState();
}

class _ListSpaceLaunchState extends State<ListSpaceLaunch> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.vertical,
      child: Column(
        children: [
          for (var element in widget.lstSpace) ...[
            SpaceCardModel(
                image: element.links.missionPatch,
                nameMission: element.missionName,
                description: element.details,
                date: element.launchYear,
                link: element.links.videoLink)
          ],

        ],
      ),
    );
  }
}


