class UpcomingDataModelLinksEntity {


  String? missionPatch;
  String? missionPatchSmall;
  String? redditCampaign;

  UpcomingDataModelLinksEntity({
    this.missionPatch,
    this.missionPatchSmall,
    this.redditCampaign,
  });
}

class UpcomingDataModelLaunchSiteEntity {


  String? siteId;
  String? siteName;
  String? siteNameLong;

  UpcomingDataModelLaunchSiteEntity({
    this.siteId,
    this.siteName,
    this.siteNameLong,
  });
}

class UpcomingDataModelRocketSecondStagePayloadsOrbitParamsEntity {


  String? referenceSystem;
  String? regime;

  UpcomingDataModelRocketSecondStagePayloadsOrbitParamsEntity({
    this.referenceSystem,
    this.regime,
  });
}

class UpcomingDataModelRocketSecondStagePayloadsEntity {

  String? payloadId;
  String? capSerial;
  bool? reused;
  List<String?>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  String? orbit;
  UpcomingDataModelRocketSecondStagePayloadsOrbitParamsEntity? orbitParams;

  UpcomingDataModelRocketSecondStagePayloadsEntity({
    this.payloadId,
    this.capSerial,
    this.reused,
    this.customers,
    this.nationality,
    this.manufacturer,
    this.payloadType,
    this.orbit,
    this.orbitParams,
  });
}

class UpcomingDataModelRocketSecondStageEntity {

  int? block;
  List<UpcomingDataModelRocketSecondStagePayloadsEntity?>? payloads;

  UpcomingDataModelRocketSecondStageEntity({
    this.block,
    this.payloads,
  });

}

class UpcomingDataModelRocketFirstStageCoresEntity {

  String? coreSerial;
  int? flight;
  int? block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingIntent;
  String? landingType;

  UpcomingDataModelRocketFirstStageCoresEntity({
    this.coreSerial,
    this.flight,
    this.block,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingIntent,
    this.landingType,
  });


}

class UpcomingDataModelRocketFirstStageEntity {

  List<UpcomingDataModelRocketFirstStageCoresEntity?>? cores;

  UpcomingDataModelRocketFirstStageEntity({
    this.cores,
  });


}

class UpcomingDataModelRocketEntity {

  String? rocketId;
  String? rocketName;
  String? rocketType;
  UpcomingDataModelRocketFirstStageEntity? firstStage;
  UpcomingDataModelRocketSecondStageEntity? secondStage;

  UpcomingDataModelRocketEntity({
    this.rocketId,
    this.rocketName,
    this.rocketType,
    this.firstStage,
    this.secondStage,
  });


}

class UpcomingDataModelEntity {


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
  UpcomingDataModelRocketEntity? rocket;
  UpcomingDataModelLaunchSiteEntity? launchSite;
  UpcomingDataModelLinksEntity? links;
  String? details;
  bool? upcoming;
  String? lastDateUpdate;
  String? lastWikiLaunchDate;
  String? lastWikiRevision;
  String? lastWikiUpdate;
  String? launchDateSource;

  UpcomingDataModelEntity({
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
    this.rocket,
    this.launchSite,
    this.links,
    this.details,
    this.upcoming,
    this.lastDateUpdate,
    this.lastWikiLaunchDate,
    this.lastWikiRevision,
    this.lastWikiUpdate,
    this.launchDateSource,
  });


}