
import 'package:space_x/features/feature_next_lunch/domain/entities/next_data_entity.dart';

class NextLaunchDataModel extends NextLaunchDataModelEntity {


  int? flightNumber;
  String? missionName;
  List<String?>? missionId;
  String? launchYear;
  int? launchDateUnix;
  String? launchDateUtc;
  String? launchDateLocal;
  bool? isTentative;
  String? details;

  NextLaunchDataModel({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.details,
  }):super(
    flightNumber: flightNumber,
    missionName: missionName,
    missionId: missionId,
    launchYear: launchYear,
    launchDateUnix: launchDateUnix,
    launchDateUtc: launchDateUtc,
    launchDateLocal: launchDateLocal,
    isTentative: isTentative,
    details: details
  );
  NextLaunchDataModel.fromJson(Map<String, dynamic> json) {
    flightNumber = json["flight_number"]?.toInt();
    missionName = json["mission_name"]?.toString();
    if (json["mission_id"] != null) {
      final v = json["mission_id"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      missionId = arr0;
    }
    launchYear = json["launch_year"]?.toString();
    launchDateUnix = json["launch_date_unix"]?.toInt();
    launchDateUtc = json["launch_date_utc"]?.toString();
    launchDateLocal = json["launch_date_local"]?.toString();
    isTentative = json["is_tentative"];
    details = json["details"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["flight_number"] = flightNumber;
    data["mission_name"] = missionName;
    if (missionId != null) {
      final v = missionId;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["mission_id"] = arr0;
    }
    data["launch_year"] = launchYear;
    data["launch_date_unix"] = launchDateUnix;
    data["launch_date_utc"] = launchDateUtc;
    data["launch_date_local"] = launchDateLocal;
    data["is_tentative"] = isTentative;
    data["details"] = details;
    return data;
  }
}
