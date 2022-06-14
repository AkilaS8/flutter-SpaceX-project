
import 'package:space_x/features/feature_launches_past/domain/entities/response/past_data_entity.dart';

class PastDataModelLinks extends PastDataModelLinksEntity{


  String? wikipedia;
  String? videoLink;
  String? youtubeId;

  PastDataModelLinks({
    this.wikipedia,
    this.videoLink,
    this.youtubeId,
  }):super(
    wikipedia: wikipedia,
    videoLink: videoLink,
    youtubeId: youtubeId
  );
  PastDataModelLinks.fromJson(Map<String, dynamic> json) {
    wikipedia = json["wikipedia"]?.toString();
    videoLink = json["video_link"]?.toString();
    youtubeId = json["youtube_id"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["wikipedia"] = wikipedia;
    data["video_link"] = videoLink;
    data["youtube_id"] = youtubeId;
    return data;
  }
}

class PastDataModelLaunchSite extends PastDataModelLaunchSiteEntity {


  String? siteName;
  String? siteNameLong;

  PastDataModelLaunchSite({
    this.siteName,
    this.siteNameLong,
  }):super(
    siteName: siteName,
    siteNameLong: siteNameLong
  );

  PastDataModelLaunchSite.fromJson(Map<String, dynamic> json) {
    siteName = json["site_name"]?.toString();
    siteNameLong = json["site_name_long"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["site_name"] = siteName;
    data["site_name_long"] = siteNameLong;
    return data;
  }
}

class PastDataModelRocket extends PastDataModelRocketEntity {

  String? rocketId;
  String? rocketName;

  PastDataModelRocket({
    this.rocketId,
    this.rocketName,
  }):super(
    rocketId: rocketId,
    rocketName: rocketName,
  );


  PastDataModelRocket.fromJson(Map<String, dynamic> json) {
    rocketId = json["rocket_id"]?.toString();
    rocketName = json["rocket_name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["rocket_id"] = rocketId;
    data["rocket_name"] = rocketName;
    return data;
  }
}

class PastDataModel extends PastDataModelEntity{


  int? flightNumber;
  String? launchYear;
  String? launchDateUtc;
  String? launchDateLocal;
  PastDataModelRocket? rocketPast;
  PastDataModelLaunchSite? launchSitePast;
  bool? launchSuccess;
  PastDataModelLinks? linksPast;
  String? details;

  PastDataModel({
    this.flightNumber,
    this.launchYear,
    this.launchDateUtc,
    this.launchDateLocal,
    this.rocketPast,
    this.launchSitePast,
    this.launchSuccess,
    this.linksPast,
    this.details,
  }):super(
    flightNumber: flightNumber,
    launchYear: launchYear,
    launchDateUtc: launchDateUtc,
    launchDateLocal: launchDateLocal,
    rocket: rocketPast,
    launchSite: launchSitePast,
    launchSuccess: launchSuccess,
    links: linksPast,
    details: details

  );
  PastDataModel.fromJson(Map<String, dynamic> json) {
    flightNumber = json["flight_number"]?.toInt();
    launchYear = json["launch_year"]?.toString();
    launchDateUtc = json["launch_date_utc"]?.toString();
    launchDateLocal = json["launch_date_local"]?.toString();
    rocketPast = (json["rocket"] != null) ? PastDataModelRocket.fromJson(json["rocket"]) : null;
    launchSitePast = (json["launch_site"] != null) ? PastDataModelLaunchSite.fromJson(json["launch_site"]) : null;
    launchSuccess = json["launch_success"];
    linksPast = (json["links"] != null) ? PastDataModelLinks.fromJson(json["links"]) : null;
    details = json["details"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["flight_number"] = flightNumber;
    data["launch_year"] = launchYear;
    data["launch_date_utc"] = launchDateUtc;
    data["launch_date_local"] = launchDateLocal;
    if (rocketPast != null) {
      data["rocket"] = rocketPast!.toJson();
    }
    if (launchSitePast != null) {
      data["launch_site"] = launchSitePast!.toJson();
    }
    data["launch_success"] = launchSuccess;
    if (linksPast != null) {
      data["links"] = linksPast!.toJson();
    }
    data["details"] = details;
    return data;
  }
}
