class ShipDataModelMissionsEntity {

  String? name;
  int? flight;

  ShipDataModelMissionsEntity({
    this.name,
    this.flight,
  });
}

class ShipDataModelEntity {

  String? shipId;
  String? shipName;
  String? shipType;
  List<String?>? roles;
  bool? active;
  String? homePort;
  List<ShipDataModelMissionsEntity?>? missions;
  String? url;
  String? image;

  ShipDataModelEntity({
    this.shipId,
    this.shipName,
    this.shipType,
    this.roles,
    this.active,
    this.homePort,
    this.missions,
    this.url,
    this.image,
  });

}
