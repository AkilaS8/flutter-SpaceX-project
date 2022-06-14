import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';

class MissionsDataModel extends MissionsDataModelEntity {

  String? missionName;
  String? missionId;
  List<String?>? manufacturers;
  List<String?>? payloadIds;
  String? wikipedia;
  String? website;
  String? twitter;
  String? description;

  MissionsDataModel({
    this.missionName,
    this.missionId,
    this.manufacturers,
    this.payloadIds,
    this.wikipedia,
    this.website,
    this.twitter,
    this.description,
  }):super(
    missionName: missionName,
    missionId: missionId,
    manufacturers: manufacturers,
    payloadIds: payloadIds,
    wikipedia: wikipedia,
    website: website,
    twitter: twitter,
    description: description
  );
  MissionsDataModel.fromJson(Map<String, dynamic> json) {
    missionName = json["mission_name"]?.toString();
    missionId = json["mission_id"]?.toString();
    if (json["manufacturers"] != null) {
      final v = json["manufacturers"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      manufacturers = arr0;
    }
    if (json["payload_ids"] != null) {
      final v = json["payload_ids"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      payloadIds = arr0;
    }
    wikipedia = json["wikipedia"]?.toString();
    website = json["website"]?.toString();
    twitter = json["twitter"]?.toString();
    description = json["description"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["mission_name"] = missionName;
    data["mission_id"] = missionId;
    if (manufacturers != null) {
      final v = manufacturers;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["manufacturers"] = arr0;
    }
    if (payloadIds != null) {
      final v = payloadIds;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["payload_ids"] = arr0;
    }
    data["wikipedia"] = wikipedia;
    data["website"] = website;
    data["twitter"] = twitter;
    data["description"] = description;
    return data;
  }
}
