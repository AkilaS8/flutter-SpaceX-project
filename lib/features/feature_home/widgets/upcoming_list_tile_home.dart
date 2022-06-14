import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';

class UpcomingHomeListTile extends StatelessWidget {
  UpcomingDataModelEntity upcoming;

  UpcomingHomeListTile({required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          color: kHomeCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 25.0, bottom: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Upcoming Launch",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kAppbarColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      "Mission Name:  " + upcoming.missionName.toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Center(
                    child: Text(
                      dateConverter(upcoming.launchDateUnix),
                      style: TextStyle(
                        fontSize: 30.0,
                        color: kCardColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String dateConverter(var unix) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}
