import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_next_lunch/domain/entities/next_data_entity.dart';

class NextLaunchListTileHome extends StatelessWidget {
  NextLaunchDataModelEntity next;

  NextLaunchListTileHome({required this.next});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kHomeCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Text(
              "Next Launch",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: kAppbarColor,
              ),
            ),
          ),
          Center(
            child: Text(
              dateConverter(next.launchDateUnix),
              style: TextStyle(
                fontSize: 30.0,
                color: kCardColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Text(
              "Mission Name:  " + next.missionName.toString(),
              style: TextStyle(
                fontSize: 15.0,
                color: kAppbarColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Text(
              "Mission ID:  " + next.missionId![0].toString(),
              style: TextStyle(
                fontSize: 15.0,
                color: kAppbarColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String dateConverter(var unix) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}
