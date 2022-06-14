class RocketDataEntityEnginesIsp {
  int? seaLevel;
  int? vacuum;

  RocketDataEntityEnginesIsp({
    this.seaLevel,
    this.vacuum,
  });
}

class RocketDataEntityEngines {
  int? number;
  String? type;
  String? version;
  String? layout;
  RocketDataEntityEnginesIsp? isp;
  int? engineLossMax;
  String? propellant_1;
  String? propellant_2;

  RocketDataEntityEngines({
    this.number,
    this.type,
    this.version,
    this.layout,
    this.isp,
    this.engineLossMax,
    this.propellant_1,
    this.propellant_2,
  });
}

class RocketDataEntityMass {
  int? kg;

  RocketDataEntityMass({
    this.kg,
  });
}

class RocketDataEntityDiameter {
  double? meters;

  RocketDataEntityDiameter({
    this.meters,
  });
}

class RocketDataEntityHeight {
  int? meters;

  RocketDataEntityHeight({
    this.meters,
  });
}

class RocketDataEntity {
  int? id;
  bool? active;
  int? stages;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  RocketDataEntityHeight? height;
  RocketDataEntityDiameter? diameter;
  RocketDataEntityMass? mass;
  RocketDataEntityEngines? engines;
  List<String?>? flickrImages;
  String? wikipedia;
  String? description;
  String? rocketId;
  String? rocketName;
  String? rocketType;

  RocketDataEntity({
    this.id,
    this.active,
    this.stages,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.height,
    this.diameter,
    this.mass,
    this.engines,
    this.flickrImages,
    this.wikipedia,
    this.description,
    this.rocketId,
    this.rocketName,
    this.rocketType,
  });
}
