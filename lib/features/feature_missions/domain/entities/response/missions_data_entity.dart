class MissionsDataModelEntity {

  String? missionName;
  String? missionId;
  List<String?>? manufacturers;
  List<String?>? payloadIds;
  String? wikipedia;
  String? website;
  String? twitter;
  String? description;

  MissionsDataModelEntity({
    this.missionName,
    this.missionId,
    this.manufacturers,
    this.payloadIds,
    this.wikipedia,
    this.website,
    this.twitter,
    this.description,
  });
}
