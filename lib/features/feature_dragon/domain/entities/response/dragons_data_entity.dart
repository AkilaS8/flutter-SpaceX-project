class DragonDataModelDiameterEntity {
  double? meters;

  DragonDataModelDiameterEntity({
    this.meters,
  });
}

class DragonDataModelHeightWTrunkEntity {

  double? meters;

  DragonDataModelHeightWTrunkEntity({
    this.meters,
  });
}

class DragonDataModelTrunkCargoEntity {

  int? solarArray;
  bool? unpressurizedCargo;

  DragonDataModelTrunkCargoEntity({
    this.solarArray,
    this.unpressurizedCargo,
  });
}

class DragonDataModelTrunkTrunkVolumeEntity {

  int? cubicMeters;

  DragonDataModelTrunkTrunkVolumeEntity({
    this.cubicMeters,
  });
}

class DragonDataModelTrunkEntity {

  DragonDataModelTrunkTrunkVolumeEntity? trunkVolume;
  DragonDataModelTrunkCargoEntity? cargo;

  DragonDataModelTrunkEntity({
    this.trunkVolume,
    this.cargo,
  });
}

class DragonDataModelPressurizedCapsulePayloadVolumeEntity {

  int? cubicMeters;

  DragonDataModelPressurizedCapsulePayloadVolumeEntity({
    this.cubicMeters,
  });
}

class DragonDataModelPressurizedCapsuleEntity {

  DragonDataModelPressurizedCapsulePayloadVolumeEntity? payloadVolume;

  DragonDataModelPressurizedCapsuleEntity({
    this.payloadVolume,
  });
}

class DragonDataModelReturnPayloadVolEntity {

  int? cubicMeters;

  DragonDataModelReturnPayloadVolEntity({
    this.cubicMeters,
  });
}

class DragonDataModelReturnPayloadMassEntity {

  int? kg;

  DragonDataModelReturnPayloadMassEntity({
    this.kg,
  });
}

class DragonDataModelLaunchPayloadVolEntity {

  int? cubicMeters;

  DragonDataModelLaunchPayloadVolEntity({
    this.cubicMeters,
  });
}

class DragonDataModelLaunchPayloadMassEntity {

  int? kg;

  DragonDataModelLaunchPayloadMassEntity({
    this.kg,
  });
}

class DragonDataModelHeatShieldEntity {

  String? material;
  double? sizeMeters;
  int? tempDegrees;

  DragonDataModelHeatShieldEntity({
    this.material,
    this.sizeMeters,
    this.tempDegrees,
  });
}

class DragonDataEntity {

  String? id;
  String? name;
  String? type;
  bool? active;
  int? crewCapacity;
  int? dryMassKg;
  String? firstFlight;
  DragonDataModelHeatShieldEntity? heatShield;
  DragonDataModelLaunchPayloadMassEntity? launchPayloadMass;
  DragonDataModelLaunchPayloadVolEntity? launchPayloadVol;
  DragonDataModelReturnPayloadMassEntity? returnPayloadMass;
  DragonDataModelReturnPayloadVolEntity? returnPayloadVol;
  DragonDataModelPressurizedCapsuleEntity? pressurizedCapsule;
  DragonDataModelTrunkEntity? trunk;
  DragonDataModelHeightWTrunkEntity? heightWTrunk;
  DragonDataModelDiameterEntity? diameter;
  List<String?>? flickrImages;
  String? wikipedia;
  String? description;

  DragonDataEntity({
    this.id,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.dryMassKg,
    this.firstFlight,
    this.heatShield,
    this.launchPayloadMass,
    this.launchPayloadVol,
    this.returnPayloadMass,
    this.returnPayloadVol,
    this.pressurizedCapsule,
    this.trunk,
    this.heightWTrunk,
    this.diameter,
    this.flickrImages,
    this.wikipedia,
    this.description,
  });
}
