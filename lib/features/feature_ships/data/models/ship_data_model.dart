import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';

class ShipDataModelMissions extends ShipDataModelMissionsEntity {
  String? name;
  int? flight;

  ShipDataModelMissions({
    this.name,
    this.flight,
  }) : super(
          name: name,
          flight: flight,
        );

  ShipDataModelMissions.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    flight = json["flight"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["flight"] = flight;
    return data;
  }
}

class ShipDataModel extends ShipDataModelEntity {
  String? shipId;
  String? shipName;
  String? shipType;
  List<String?>? roles;
  bool? active;
  String? homePort;
  List<ShipDataModelMissions?>? missionsShips;
  String? url;
  String? image;

  ShipDataModel({
    this.shipId,
    this.shipName,
    this.shipType,
    this.roles,
    this.active,
    this.homePort,
    this.missionsShips,
    this.url,
    this.image,
  }) : super(
          shipId: shipId,
          shipName: shipName,
          shipType: shipType,
          roles: roles,
          active: active,
          homePort: homePort,
          missions: missionsShips,
          url: url,
          image: image,
        );

  ShipDataModel.fromJson(Map<String, dynamic> json) {
    shipId = json["ship_id"]?.toString();
    shipName = json["ship_name"]?.toString();
    shipType = json["ship_type"]?.toString();
    if (json["roles"] != null) {
      final v = json["roles"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      roles = arr0;
    }
    active = json["active"];
    homePort = json["home_port"]?.toString();
    if (json["missions"] != null) {
      final v = json["missions"];
      final arr0 = <ShipDataModelMissions>[];
      v.forEach((v) {
        arr0.add(ShipDataModelMissions.fromJson(v));
      });
      missionsShips = arr0;
    }
    url = json["url"]?.toString();
    image = json["image"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["ship_id"] = shipId;
    data["ship_name"] = shipName;
    data["ship_type"] = shipType;
    if (roles != null) {
      final v = roles;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["roles"] = arr0;
    }
    data["active"] = active;
    data["home_port"] = homePort;
    if (missionsShips != null) {
      final v = missionsShips;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["missions"] = arr0;
    }
    data["url"] = url;
    data["image"] = image;
    return data;
  }
}
