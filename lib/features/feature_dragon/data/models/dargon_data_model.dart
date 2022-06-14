import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';

class DragonDataModelDiameter extends DragonDataModelDiameterEntity {
  double? meters;

  DragonDataModelDiameter({
    this.meters,
  }) : super(
          meters: meters,
        );

  DragonDataModelDiameter.fromJson(Map<String, dynamic> json) {
    meters = json["meters"]?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["meters"] = meters;
    return data;
  }
}

class DragonDataModelHeightWTrunk extends DragonDataModelHeightWTrunkEntity {
  double? meters;

  DragonDataModelHeightWTrunk({
    this.meters,
  }) : super(
          meters: meters,
        );

  DragonDataModelHeightWTrunk.fromJson(Map<String, dynamic> json) {
    meters = json["meters"]?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["meters"] = meters;
    return data;
  }
}

class DragonDataModelTrunkCargo extends DragonDataModelTrunkCargoEntity {
  int? solarArray;
  bool? unpressurizedCargo;

  DragonDataModelTrunkCargo({
    this.solarArray,
    this.unpressurizedCargo,
  }) : super(
          solarArray: solarArray,
          unpressurizedCargo: unpressurizedCargo,
        );

  DragonDataModelTrunkCargo.fromJson(Map<String, dynamic> json) {
    solarArray = json["solar_array"]?.toInt();
    unpressurizedCargo = json["unpressurized_cargo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["solar_array"] = solarArray;
    data["unpressurized_cargo"] = unpressurizedCargo;
    return data;
  }
}

class DragonDataModelTrunkTrunkVolume
    extends DragonDataModelTrunkTrunkVolumeEntity {
  int? cubicMeters;

  DragonDataModelTrunkTrunkVolume({
    this.cubicMeters,
  }) : super(
          cubicMeters: cubicMeters,
        );

  DragonDataModelTrunkTrunkVolume.fromJson(Map<String, dynamic> json) {
    cubicMeters = json["cubic_meters"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["cubic_meters"] = cubicMeters;
    return data;
  }
}

class DragonDataModelTrunk extends DragonDataModelTrunkEntity {
  DragonDataModelTrunkTrunkVolume? trunkVolumeDragon;
  DragonDataModelTrunkCargo? cargoDragon;

  DragonDataModelTrunk({
    this.trunkVolumeDragon,
    this.cargoDragon,
  }) : super(
          trunkVolume: trunkVolumeDragon,
          cargo: cargoDragon,
        );

  DragonDataModelTrunk.fromJson(Map<String, dynamic> json) {
    trunkVolumeDragon = (json["trunk_volume"] != null)
        ? DragonDataModelTrunkTrunkVolume.fromJson(json["trunk_volume"])
        : null;
    cargoDragon = (json["cargo"] != null)
        ? DragonDataModelTrunkCargo.fromJson(json["cargo"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (trunkVolumeDragon != null) {
      data["trunk_volume"] = trunkVolumeDragon!.toJson();
    }
    if (cargoDragon != null) {
      data["cargo"] = cargoDragon!.toJson();
    }
    return data;
  }
}

class DragonDataModelPressurizedCapsulePayloadVolume
    extends DragonDataModelPressurizedCapsulePayloadVolumeEntity {
  int? cubicMeters;

  DragonDataModelPressurizedCapsulePayloadVolume({
    this.cubicMeters,
  }) : super(
          cubicMeters: cubicMeters,
        );

  DragonDataModelPressurizedCapsulePayloadVolume.fromJson(
      Map<String, dynamic> json) {
    cubicMeters = json["cubic_meters"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["cubic_meters"] = cubicMeters;
    return data;
  }
}

class DragonDataModelPressurizedCapsule
    extends DragonDataModelPressurizedCapsuleEntity {
  DragonDataModelPressurizedCapsulePayloadVolume? payloadVolumeDragon;

  DragonDataModelPressurizedCapsule({
    this.payloadVolumeDragon, //payloadVolume
  }) : super(
          payloadVolume: payloadVolumeDragon,
        );

  DragonDataModelPressurizedCapsule.fromJson(Map<String, dynamic> json) {
    payloadVolumeDragon = (json["payload_volume"] != null)
        ? DragonDataModelPressurizedCapsulePayloadVolume.fromJson(
            json["payload_volume"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (payloadVolumeDragon != null) {
      data["payload_volume"] = payloadVolumeDragon!.toJson();
    }
    return data;
  }
}

class DragonDataModelReturnPayloadVol
    extends DragonDataModelReturnPayloadVolEntity {
  int? cubicMeters;

  DragonDataModelReturnPayloadVol({
    this.cubicMeters,
  }) : super(
          cubicMeters: cubicMeters,
        );

  DragonDataModelReturnPayloadVol.fromJson(Map<String, dynamic> json) {
    cubicMeters = json["cubic_meters"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["cubic_meters"] = cubicMeters;
    return data;
  }
}

class DragonDataModelReturnPayloadMass
    extends DragonDataModelReturnPayloadMassEntity {
  int? kg;

  DragonDataModelReturnPayloadMass({
    this.kg,
  }) : super(
          kg: kg,
        );

  DragonDataModelReturnPayloadMass.fromJson(Map<String, dynamic> json) {
    kg = json["kg"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["kg"] = kg;
    return data;
  }
}

class DragonDataModelLaunchPayloadVol
    extends DragonDataModelLaunchPayloadVolEntity {
  int? cubicMeters;

  DragonDataModelLaunchPayloadVol({
    this.cubicMeters,
  }) : super(
          cubicMeters: cubicMeters,
        );

  DragonDataModelLaunchPayloadVol.fromJson(Map<String, dynamic> json) {
    cubicMeters = json["cubic_meters"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["cubic_meters"] = cubicMeters;
    return data;
  }
}

class DragonDataModelLaunchPayloadMass
    extends DragonDataModelLaunchPayloadMassEntity {
  int? kg;

  DragonDataModelLaunchPayloadMass({
    this.kg,
  }) : super(
          kg: kg,
        );

  DragonDataModelLaunchPayloadMass.fromJson(Map<String, dynamic> json) {
    kg = json["kg"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["kg"] = kg;
    return data;
  }
}

class DragonDataModelHeatShield extends DragonDataModelHeatShieldEntity {
  String? material;
  double? sizeMeters;
  int? tempDegrees;

  DragonDataModelHeatShield({
    this.material,
    this.sizeMeters,
    this.tempDegrees,
  }) : super(
          material: material,
          sizeMeters: sizeMeters,
          tempDegrees: tempDegrees,
        );

  DragonDataModelHeatShield.fromJson(Map<String, dynamic> json) {
    material = json["material"]?.toString();
    sizeMeters = json["size_meters"]?.toDouble();
    tempDegrees = json["temp_degrees"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["material"] = material;
    data["size_meters"] = sizeMeters;
    data["temp_degrees"] = tempDegrees;
    return data;
  }
}

class DragonDataModel extends DragonDataEntity {
  String? id;
  String? name;
  String? type;
  bool? active;
  int? crewCapacity;
  int? dryMassKg;
  String? firstFlight;
  DragonDataModelHeatShield? heatShieldDragon;
  DragonDataModelLaunchPayloadMass? launchPayloadMassDragon;
  DragonDataModelLaunchPayloadVol? launchPayloadVolDragon;
  DragonDataModelReturnPayloadMass? returnPayloadMassDragon;
  DragonDataModelReturnPayloadVol? returnPayloadVolDragon;
  DragonDataModelPressurizedCapsule? pressurizedCapsuleDragon;
  DragonDataModelTrunk? trunkDragon;
  DragonDataModelHeightWTrunk? heightWTrunkDragon;
  DragonDataModelDiameter? diameterDragon;
  List<String?>? flickrImages;
  String? wikipedia;
  String? description;

  DragonDataModel({
    this.id,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.dryMassKg,
    this.firstFlight,
    this.heatShieldDragon,
    this.launchPayloadMassDragon,
    this.launchPayloadVolDragon,
    this.returnPayloadMassDragon,
    this.returnPayloadVolDragon,
    this.pressurizedCapsuleDragon,
    this.trunkDragon,
    this.heightWTrunkDragon,
    this.diameterDragon,
    this.flickrImages,
    this.wikipedia,
    this.description,
  }) : super(
          id: id,
          name: name,
          type: type,
          active: active,
          crewCapacity: crewCapacity,
          dryMassKg: dryMassKg,
          firstFlight: firstFlight,
          heatShield: heatShieldDragon,
          launchPayloadMass: launchPayloadMassDragon,
          launchPayloadVol: launchPayloadVolDragon,
          returnPayloadMass: returnPayloadMassDragon,
          returnPayloadVol: returnPayloadVolDragon,
          pressurizedCapsule: pressurizedCapsuleDragon,
          trunk: trunkDragon,
          heightWTrunk: heightWTrunkDragon,
          diameter: diameterDragon,
          flickrImages: flickrImages,
          wikipedia: wikipedia,
          description: description,
        );

  DragonDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    name = json["name"]?.toString();
    type = json["type"]?.toString();
    active = json["active"];
    crewCapacity = json["crew_capacity"]?.toInt();
    dryMassKg = json["dry_mass_kg"]?.toInt();
    firstFlight = json["first_flight"]?.toString();
    heatShieldDragon = (json["heat_shield"] != null)
        ? DragonDataModelHeatShield.fromJson(json["heat_shield"])
        : null;
    launchPayloadMassDragon = (json["launch_payload_mass"] != null)
        ? DragonDataModelLaunchPayloadMass.fromJson(json["launch_payload_mass"])
        : null;
    launchPayloadVolDragon = (json["launch_payload_vol"] != null)
        ? DragonDataModelLaunchPayloadVol.fromJson(json["launch_payload_vol"])
        : null;
    returnPayloadMassDragon = (json["return_payload_mass"] != null)
        ? DragonDataModelReturnPayloadMass.fromJson(json["return_payload_mass"])
        : null;
    returnPayloadVolDragon = (json["return_payload_vol"] != null)
        ? DragonDataModelReturnPayloadVol.fromJson(json["return_payload_vol"])
        : null;
    pressurizedCapsuleDragon = (json["pressurized_capsule"] != null)
        ? DragonDataModelPressurizedCapsule.fromJson(
            json["pressurized_capsule"])
        : null;
    trunkDragon = (json["trunk"] != null)
        ? DragonDataModelTrunk.fromJson(json["trunk"])
        : null;
    heightWTrunkDragon = (json["height_w_trunk"] != null)
        ? DragonDataModelHeightWTrunk.fromJson(json["height_w_trunk"])
        : null;
    diameterDragon = (json["diameter"] != null)
        ? DragonDataModelDiameter.fromJson(json["diameter"])
        : null;
    if (json["flickr_images"] != null) {
      final v = json["flickr_images"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      flickrImages = arr0;
    }
    wikipedia = json["wikipedia"]?.toString();
    description = json["description"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["type"] = type;
    data["active"] = active;
    data["crew_capacity"] = crewCapacity;
    data["dry_mass_kg"] = dryMassKg;
    data["first_flight"] = firstFlight;
    if (heatShieldDragon != null) {
      data["heat_shield"] = heatShieldDragon!.toJson();
    }
    if (launchPayloadMassDragon != null) {
      data["launch_payload_mass"] = launchPayloadMassDragon!.toJson();
    }
    if (launchPayloadVolDragon != null) {
      data["launch_payload_vol"] = launchPayloadVolDragon!.toJson();
    }
    if (returnPayloadMassDragon != null) {
      data["return_payload_mass"] = returnPayloadMassDragon!.toJson();
    }
    if (returnPayloadVolDragon != null) {
      data["return_payload_vol"] = returnPayloadVolDragon!.toJson();
    }
    if (pressurizedCapsuleDragon != null) {
      data["pressurized_capsule"] = pressurizedCapsuleDragon!.toJson();
    }
    if (trunkDragon != null) {
      data["trunk"] = trunkDragon!.toJson();
    }
    if (heightWTrunkDragon != null) {
      data["height_w_trunk"] = heightWTrunkDragon!.toJson();
    }
    if (diameterDragon != null) {
      data["diameter"] = diameterDragon!.toJson();
    }
    if (flickrImages != null) {
      final v = flickrImages;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["flickr_images"] = arr0;
    }
    data["wikipedia"] = wikipedia;
    data["description"] = description;
    return data;
  }
}
