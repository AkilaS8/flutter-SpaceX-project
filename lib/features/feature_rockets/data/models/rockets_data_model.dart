import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';

class RocketDataModelEnginesIsp extends RocketDataEntityEnginesIsp {
  int? seaLevel;
  int? vacuum;

  RocketDataModelEnginesIsp({
    this.seaLevel,
    this.vacuum,
  }) : super(
          seaLevel: seaLevel,
          vacuum: vacuum,
        );

  RocketDataModelEnginesIsp.fromJson(Map<String, dynamic> json) {
    seaLevel = json["sea_level"]?.toInt();
    vacuum = json["vacuum"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["sea_level"] = seaLevel;
    data["vacuum"] = vacuum;
    return data;
  }
}

class RocketDataModelEngines extends RocketDataEntityEngines {
  int? number;
  String? type;
  String? version;
  String? layout;
  RocketDataModelEnginesIsp? engineIsp;
  int? engineLossMax;
  String? propellant_1;
  String? propellant_2;

  RocketDataModelEngines({
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineIsp,
    this.engineLossMax,
    this.propellant_1,
    this.propellant_2,
  }) : super(
          number: number,
          type: type,
          version: version,
          layout: layout,
          isp: engineIsp,
          engineLossMax: engineLossMax,
          propellant_1: propellant_1,
          propellant_2: propellant_2,
        );

  RocketDataModelEngines.fromJson(Map<String, dynamic> json) {
    number = json["number"]?.toInt();
    type = json["type"]?.toString();
    version = json["version"]?.toString();
    layout = json["layout"]?.toString();
    isp = (json["isp"] != null)
        ? RocketDataModelEnginesIsp.fromJson(json["isp"])
        : null;
    engineLossMax = json["engine_loss_max"]?.toInt();
    propellant_1 = json["propellant_1"]?.toString();
    propellant_2 = json["propellant_2"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["number"] = number;
    data["type"] = type;
    data["version"] = version;
    data["layout"] = layout;
    if (isp != null) {
      data["isp"] = engineIsp!.toJson();
    }
    data["engine_loss_max"] = engineLossMax;
    data["propellant_1"] = propellant_1;
    data["propellant_2"] = propellant_2;
    return data;
  }
}

class RocketDataModelMass extends RocketDataEntityMass {
  int? kg;

  RocketDataModelMass({
    this.kg,
  }) : super(
          kg: kg,
        );

  RocketDataModelMass.fromJson(Map<String, dynamic> json) {
    kg = json["kg"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["kg"] = kg;
    return data;
  }
}

class RocketDataModelDiameter extends RocketDataEntityDiameter {
  double? meters;

  RocketDataModelDiameter({
    this.meters,
  }) : super(
          meters: meters,
        );

  RocketDataModelDiameter.fromJson(Map<String, dynamic> json) {
    meters = json["meters"]?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["meters"] = meters;
    return data;
  }
}

class RocketDataModelHeight extends RocketDataEntityHeight {
  int? meters;

  RocketDataModelHeight({
    this.meters,
  }) : super(
          meters: meters,
        );

  RocketDataModelHeight.fromJson(Map<String, dynamic> json) {
    meters = json["meters"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["meters"] = meters;
    return data;
  }
}

class RocketDataModel extends RocketDataEntity {
  int? id;
  bool? active;
  int? stages;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  RocketDataModelHeight? rocketHeight;
  RocketDataModelDiameter? rocketDiameter;
  RocketDataModelMass? rocketMass;
  RocketDataModelEngines? rocketEngines;
  List<String?>? flickrImages;
  String? wikipedia;
  String? description;
  String? rocketId;
  String? rocketName;
  String? rocketType;

  RocketDataModel({
    this.id,
    this.active,
    this.stages,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.rocketHeight,
    this.rocketDiameter,
    this.rocketMass,
    this.rocketEngines,
    this.flickrImages,
    this.wikipedia,
    this.description,
    this.rocketId,
    this.rocketName,
    this.rocketType,
  }) : super(
          id: id,
          active: active,
          stages: stages,
          costPerLaunch: costPerLaunch,
          successRatePct: successRatePct,
          firstFlight: firstFlight,
          country: country,
          company: company,
          height: rocketHeight,
          diameter: rocketDiameter,
          mass: rocketMass,
          engines: rocketEngines,
          flickrImages: flickrImages,
          wikipedia: wikipedia,
          description: description,
          rocketId: rocketId,
          rocketName: rocketName,
          rocketType: rocketType,
        );

  RocketDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    active = json["active"];
    stages = json["stages"]?.toInt();
    costPerLaunch = json["cost_per_launch"]?.toInt();
    successRatePct = json["success_rate_pct"]?.toInt();
    firstFlight = json["first_flight"]?.toString();
    country = json["country"]?.toString();
    company = json["company"]?.toString();
    rocketHeight = (json["height"] != null)
        ? RocketDataModelHeight.fromJson(json["height"])
        : null;
    diameter = (json["diameter"] != null)
        ? RocketDataModelDiameter.fromJson(json["diameter"])
        : null;
    mass = (json["mass"] != null)
        ? RocketDataModelMass.fromJson(json["mass"])
        : null;
    engines = (json["engines"] != null)
        ? RocketDataModelEngines.fromJson(json["engines"])
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
    rocketId = json["rocket_id"]?.toString();
    rocketName = json["rocket_name"]?.toString();
    rocketType = json["rocket_type"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["active"] = active;
    data["stages"] = stages;
    data["cost_per_launch"] = costPerLaunch;
    data["success_rate_pct"] = successRatePct;
    data["first_flight"] = firstFlight;
    data["country"] = country;
    data["company"] = company;
    if (rocketHeight != null) {
      data["height"] = rocketHeight!.toJson();
    }
    if (diameter != null) {
      data["diameter"] = rocketDiameter!.toJson();
    }
    if (mass != null) {
      data["mass"] = rocketMass!.toJson();
    }
    if (engines != null) {
      data["engines"] = rocketEngines!.toJson();
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
    data["rocket_id"] = rocketId;
    data["rocket_name"] = rocketName;
    data["rocket_type"] = rocketType;
    return data;
  }
}
