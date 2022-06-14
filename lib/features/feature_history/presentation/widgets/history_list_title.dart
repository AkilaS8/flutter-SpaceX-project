import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/custom_icons/custom_icons_icons.dart';
import 'package:space_x/features/feature_history/domain/entities/response/history_data_entity.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryListTile extends StatelessWidget {
  final HistoryDataModelEntity history;

  HistoryListTile({required this.history});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.07,
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  history.title.toString(),
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  dateConverter(history.eventDateUnix),
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  "Flight Number: " + history.flightNumber.toString(),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 10.0, right: 15.0, bottom: 25.0),
                child: Text(
                  history.details.toString(),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
      indicatorStyle: IndicatorStyle(
        color: Colors.white,
        width: 30.0,
        padding: EdgeInsets.symmetric(vertical: 3.0),
        iconStyle: IconStyle(
          color: kAppbarColor,
          iconData: CustomIcons.rocket_1,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: Colors.blueGrey,
        thickness: 4,
      ),
    );
  }

  String dateConverter(var unix) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}