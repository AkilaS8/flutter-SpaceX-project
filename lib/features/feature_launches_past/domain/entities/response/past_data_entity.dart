
class PastDataModelLinksEntity {


  String? wikipedia;
  String? videoLink;
  String? youtubeId;

  PastDataModelLinksEntity({
    this.wikipedia,
    this.videoLink,
    this.youtubeId,
  });
}

class PastDataModelLaunchSiteEntity {


  String? siteName;
  String? siteNameLong;

  PastDataModelLaunchSiteEntity({
    this.siteName,
    this.siteNameLong,
  });
}

class PastDataModelRocketEntity {


  String? rocketId;
  String? rocketName;

  PastDataModelRocketEntity({
    this.rocketId,
    this.rocketName,
  });
}

class PastDataModelEntity {


  int? flightNumber;
  String? launchYear;
  String? launchDateUtc;
  String? launchDateLocal;
  PastDataModelRocketEntity? rocket;
  PastDataModelLaunchSiteEntity? launchSite;
  bool? launchSuccess;
  PastDataModelLinksEntity? links;
  String? details;

  PastDataModelEntity({
    this.flightNumber,
    this.launchYear,
    this.launchDateUtc,
    this.launchDateLocal,
    this.rocket,
    this.launchSite,
    this.launchSuccess,
    this.links,
    this.details,
  });
}
