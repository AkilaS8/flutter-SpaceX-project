import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';
import 'package:space_x/features/feature_missions/presentation/pages/missions_detailed_page.dart';

class MissionsListTile extends StatelessWidget {
  final MissionsDataModelEntity mission;

  MissionsListTile({required this.mission});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: ListTile(
            title: Text(
              mission.missionName.toString(),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            subtitle: Text(
              "Mission ID: " +
                  mission.missionId.toString() +
                  "\n" +
                  mission.manufacturers.toString(),
            ),
            isThreeLine: true,
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MissionsDetailedPage(
                          mission: mission,
                        )),
              )
            },
          ),
        ),
      ),
    );
  }
}
