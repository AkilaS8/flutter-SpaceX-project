import 'package:flutter/material.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';

class UpcomingListTile extends StatelessWidget {
  final UpcomingDataModelEntity upcoming;

  UpcomingListTile({
    required this.upcoming
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                upcoming.missionName.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'SegoeUI',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                upcoming.details.toString(),
                textAlign: TextAlign.justify,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 15.0),
              child: Row(
                children: [
                  Text(
                    "More Details",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
