import 'package:space_x/features/feature_launches_upcoming/domain/entities/response/upcoming_data_entity.dart';

class UpcomingDataModelLinks extends UpcomingDataModelLinksEntity {
  String? missionPatch;
  String? missionPatchSmall;
  String? redditCampaign;

  UpcomingDataModelLinks({
    this.missionPatch,
    this.missionPatchSmall,
    this.redditCampaign,
  }) : super(
            missionPatch: missionPatch,
            missionPatchSmall: missionPatchSmall,
            redditCampaign: redditCampaign);

  UpcomingDataModelLinks.fromJson(Map<String, dynamic> json) {
    missionPatch = json["mission_patch"]?.toString();
    missionPatchSmall = json["mission_patch_small"]?.toString();
    redditCampaign = json["reddit_campaign"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["mission_patch"] = missionPatch;
    data["mission_patch_small"] = missionPatchSmall;
    data["reddit_campaign"] = redditCampaign;
    return data;
  }
}

class UpcomingDataModelLaunchSite extends UpcomingDataModelLaunchSiteEntity {
  String? siteId;
  String? siteName;
  String? siteNameLong;

  UpcomingDataModelLaunchSite({
    this.siteId,
    this.siteName,
    this.siteNameLong,
  }) : super(siteId: siteId, siteName: siteName, siteNameLong: siteNameLong);

  UpcomingDataModelLaunchSite.fromJson(Map<String, dynamic> json) {
    siteId = json["site_id"]?.toString();
    siteName = json["site_name"]?.toString();
    siteNameLong = json["site_name_long"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["site_id"] = siteId;
    data["site_name"] = siteName;
    data["site_name_long"] = siteNameLong;
    return data;
  }
}

class UpcomingDataModelRocketSecondStagePayloadsOrbitParams
    extends UpcomingDataModelRocketSecondStagePayloadsOrbitParamsEntity {
  String? referenceSystem;
  String? regime;

  UpcomingDataModelRocketSecondStagePayloadsOrbitParams({
    this.referenceSystem,
    this.regime,
  }) : super(referenceSystem: referenceSystem, regime: regime);

  UpcomingDataModelRocketSecondStagePayloadsOrbitParams.fromJson(
      Map<String, dynamic> json) {
    referenceSystem = json["reference_system"]?.toString();
    regime = json["regime"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["reference_system"] = referenceSystem;
    data["regime"] = regime;
    return data;
  }
}

class UpcomingDataModelRocketSecondStagePayloads
    extends UpcomingDataModelRocketSecondStagePayloadsEntity {
  String? payloadId;
  String? capSerial;
  bool? reused;
  List<String?>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  String? orbit;
  UpcomingDataModelRocketSecondStagePayloadsOrbitParams? orbitParamsUpcoming;

  UpcomingDataModelRocketSecondStagePayloads({
    this.payloadId,
    this.capSerial,
    this.reused,
    this.customers,
    this.nationality,
    this.manufacturer,
    this.payloadType,
    this.orbit,
    this.orbitParamsUpcoming,
  }) : super(
            payloadId: payloadId,
            capSerial: capSerial,
            reused: reused,
            customers: customers,
            nationality: nationality,
            manufacturer: manufacturer,
            payloadType: payloadType,
            orbit: orbit,
            orbitParams: orbitParamsUpcoming);

  UpcomingDataModelRocketSecondStagePayloads.fromJson(
      Map<String, dynamic> json) {
    payloadId = json["payload_id"]?.toString();
    capSerial = json["cap_serial"]?.toString();
    reused = json["reused"];
    if (json["customers"] != null) {
      final v = json["customers"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      customers = arr0;
    }
    nationality = json["nationality"]?.toString();
    manufacturer = json["manufacturer"]?.toString();
    payloadType = json["payload_type"]?.toString();
    orbit = json["orbit"]?.toString();
    orbitParamsUpcoming = (json["orbit_params"] != null)
        ? UpcomingDataModelRocketSecondStagePayloadsOrbitParams.fromJson(
            json["orbit_params"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["payload_id"] = payloadId;
    data["cap_serial"] = capSerial;
    data["reused"] = reused;
    if (customers != null) {
      final v = customers;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["customers"] = arr0;
    }
    data["nationality"] = nationality;
    data["manufacturer"] = manufacturer;
    data["payload_type"] = payloadType;
    data["orbit"] = orbit;
    if (orbitParamsUpcoming != null) {
      data["orbit_params"] = orbitParamsUpcoming!.toJson();
    }
    return data;
  }
}

class UpcomingDataModelRocketSecondStage
    extends UpcomingDataModelRocketSecondStageEntity {
  int? block;
  List<UpcomingDataModelRocketSecondStagePayloads?>? payloadsUpcoming;

  UpcomingDataModelRocketSecondStage({
    this.block,
    this.payloadsUpcoming,
  }) : super(block: block, payloads: payloadsUpcoming);

  UpcomingDataModelRocketSecondStage.fromJson(Map<String, dynamic> json) {
    block = json["block"]?.toInt();
    if (json["payloads"] != null) {
      final v = json["payloads"];
      final arr0 = <UpcomingDataModelRocketSecondStagePayloads>[];
      v.forEach((v) {
        arr0.add(UpcomingDataModelRocketSecondStagePayloads.fromJson(v));
      });
      payloadsUpcoming = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["block"] = block;
    if (payloadsUpcoming != null) {
      final v = payloadsUpcoming;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["payloads"] = arr0;
    }
    return data;
  }
}

class UpcomingDataModelRocketFirstStageCores
    extends UpcomingDataModelRocketFirstStageCoresEntity {
  String? coreSerial;
  int? flight;
  int? block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingIntent;
  String? landingType;

  UpcomingDataModelRocketFirstStageCores({
    this.coreSerial,
    this.flight,
    this.block,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingIntent,
    this.landingType,
  }) : super(
            coreSerial: coreSerial,
            flight: flight,
            block: block,
            gridfins: gridfins,
            legs: legs,
            reused: reused,
            landingIntent: landingIntent,
            landingType: landingType);

  UpcomingDataModelRocketFirstStageCores.fromJson(Map<String, dynamic> json) {
    coreSerial = json["core_serial"]?.toString();
    flight = json["flight"]?.toInt();
    block = json["block"]?.toInt();
    gridfins = json["gridfins"];
    legs = json["legs"];
    reused = json["reused"];
    landingIntent = json["landing_intent"];
    landingType = json["landing_type"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["core_serial"] = coreSerial;
    data["flight"] = flight;
    data["block"] = block;
    data["gridfins"] = gridfins;
    data["legs"] = legs;
    data["reused"] = reused;
    data["landing_intent"] = landingIntent;
    data["landing_type"] = landingType;
    return data;
  }
}

class UpcomingDataModelRocketFirstStage
    extends UpcomingDataModelRocketFirstStageEntity {
  List<UpcomingDataModelRocketFirstStageCores?>? coresUpcoming;

  UpcomingDataModelRocketFirstStage({
    this.coresUpcoming,
  }) : super(cores: coresUpcoming);

  UpcomingDataModelRocketFirstStage.fromJson(Map<String, dynamic> json) {
    if (json["cores"] != null) {
      final v = json["cores"];
      final arr0 = <UpcomingDataModelRocketFirstStageCores>[];
      v.forEach((v) {
        arr0.add(UpcomingDataModelRocketFirstStageCores.fromJson(v));
      });
      coresUpcoming = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (coresUpcoming != null) {
      final v = coresUpcoming;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["cores"] = arr0;
    }
    return data;
  }
}

class UpcomingDataModelRocket extends UpcomingDataModelRocketEntity {
  String? rocketId;
  String? rocketName;
  String? rocketType;
  UpcomingDataModelRocketFirstStage? firstStageUpcoming;
  UpcomingDataModelRocketSecondStage? secondStageUpcoming;

  UpcomingDataModelRocket({
    this.rocketId,
    this.rocketName,
    this.rocketType,
    this.firstStageUpcoming,
    this.secondStageUpcoming,
  }) : super(
            rocketId: rocketId,
            rocketName: rocketName,
            firstStage: firstStageUpcoming,
            secondStage: secondStageUpcoming);

  UpcomingDataModelRocket.fromJson(Map<String, dynamic> json) {
    rocketId = json["rocket_id"]?.toString();
    rocketName = json["rocket_name"]?.toString();
    rocketType = json["rocket_type"]?.toString();
    firstStageUpcoming = (json["first_stage"] != null)
        ? UpcomingDataModelRocketFirstStage.fromJson(json["first_stage"])
        : null;
    secondStageUpcoming = (json["second_stage"] != null)
        ? UpcomingDataModelRocketSecondStage.fromJson(json["second_stage"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["rocket_id"] = rocketId;
    data["rocket_name"] = rocketName;
    data["rocket_type"] = rocketType;
    if (firstStageUpcoming != null) {
      data["first_stage"] = firstStageUpcoming!.toJson();
    }
    if (secondStageUpcoming != null) {
      data["second_stage"] = secondStageUpcoming!.toJson();
    }
    return data;
  }
}

class UpcomingDataModel extends UpcomingDataModelEntity {
  int? flightNumber;
  String? missionName;
  List<String?>? missionId;
  String? launchYear;
  int? launchDateUnix;
  String? launchDateUtc;
  String? launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;
  UpcomingDataModelRocket? rocketUpcoming;
  UpcomingDataModelLaunchSite? launchSiteUpcoming;
  UpcomingDataModelLinks? linksUpcoming;
  String? details;
  bool? upcoming;
  String? lastDateUpdate;
  String? lastWikiLaunchDate;
  String? lastWikiRevision;
  String? lastWikiUpdate;
  String? launchDateSource;

  UpcomingDataModel({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.tentativeMaxPrecision,
    this.tbd,
    this.rocketUpcoming,
    this.launchSiteUpcoming,
    this.linksUpcoming,
    this.details,
    this.upcoming,
    this.lastDateUpdate,
    this.lastWikiLaunchDate,
    this.lastWikiRevision,
    this.lastWikiUpdate,
    this.launchDateSource,
  }) : super(
            flightNumber: flightNumber,
            missionName: missionName,
            missionId: missionId,
            launchYear: launchYear,
            launchDateUnix: launchDateUnix,
            launchDateUtc: launchDateUtc,
            launchDateLocal: launchDateLocal,
            isTentative: isTentative,
            tentativeMaxPrecision: tentativeMaxPrecision,
            tbd: tbd,
            rocket: rocketUpcoming,
            launchSite: launchSiteUpcoming,
            links: linksUpcoming,
            details: details,
            upcoming: upcoming,
            lastDateUpdate: lastDateUpdate,
            lastWikiLaunchDate: lastWikiLaunchDate,
            lastWikiRevision: lastWikiRevision,
            lastWikiUpdate: lastWikiUpdate,
            launchDateSource: launchDateSource);

  UpcomingDataModel.fromJson(Map<String, dynamic> json) {
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
    tentativeMaxPrecision = json["tentative_max_precision"]?.toString();
    tbd = json["tbd"];
    rocketUpcoming = (json["rocket"] != null)
        ? UpcomingDataModelRocket.fromJson(json["rocket"])
        : null;
    launchSiteUpcoming = (json["launch_site"] != null)
        ? UpcomingDataModelLaunchSite.fromJson(json["launch_site"])
        : null;
    linksUpcoming = (json["links"] != null)
        ? UpcomingDataModelLinks.fromJson(json["links"])
        : null;
    details = json["details"]?.toString();
    upcoming = json["upcoming"];
    lastDateUpdate = json["last_date_update"]?.toString();
    lastWikiLaunchDate = json["last_wiki_launch_date"]?.toString();
    lastWikiRevision = json["last_wiki_revision"]?.toString();
    lastWikiUpdate = json["last_wiki_update"]?.toString();
    launchDateSource = json["launch_date_source"]?.toString();
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
    data["tentative_max_precision"] = tentativeMaxPrecision;
    data["tbd"] = tbd;
    if (rocketUpcoming != null) {
      data["rocket"] = rocketUpcoming!.toJson();
    }
    if (launchSiteUpcoming != null) {
      data["launch_site"] = launchSiteUpcoming!.toJson();
    }
    if (linksUpcoming != null) {
      data["links"] = linksUpcoming!.toJson();
    }
    data["details"] = details;
    data["upcoming"] = upcoming;
    data["last_date_update"] = lastDateUpdate;
    data["last_wiki_launch_date"] = lastWikiLaunchDate;
    data["last_wiki_revision"] = lastWikiRevision;
    data["last_wiki_update"] = lastWikiUpdate;
    data["launch_date_source"] = launchDateSource;
    return data;
  }
}
