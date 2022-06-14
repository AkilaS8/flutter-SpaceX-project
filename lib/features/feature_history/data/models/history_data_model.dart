import 'package:space_x/features/feature_history/domain/entities/response/history_data_entity.dart';

class HistoryDataModelLinks extends HistoryDataModelLinksEntity{


  String? article;
  String? wikipedia;

  HistoryDataModelLinks({
    this.article,
    this.wikipedia,
  }):super(
    article: article,
    wikipedia: wikipedia,
  );

  HistoryDataModelLinks.fromJson(Map<String, dynamic> json) {
    article = json["article"]?.toString();
    wikipedia = json["wikipedia"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["article"] = article;
    data["wikipedia"] = wikipedia;
    return data;
  }
}

class HistoryDataModel extends HistoryDataModelEntity{


  int? id;
  String? title;
  String? eventDateUtc;
  int? eventDateUnix;
  int? flightNumber;
  String? details;
  HistoryDataModelLinks? linksHistory;

  HistoryDataModel({
    this.id,
    this.title,
    this.eventDateUtc,
    this.eventDateUnix,
    this.flightNumber,
    this.details,
    this.linksHistory,
  }):super(

    id : id,
    title:title,
    eventDateUtc: eventDateUtc,
    eventDateUnix:eventDateUnix,
    flightNumber:flightNumber,
    details:details,
    links:linksHistory,

  );
  HistoryDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    title = json["title"]?.toString();
    eventDateUtc = json["event_date_utc"]?.toString();
    eventDateUnix = json["event_date_unix"]?.toInt();
    flightNumber = json["flight_number"]?.toInt();
    details = json["details"]?.toString();
    linksHistory = (json["links"] != null) ? HistoryDataModelLinks.fromJson(json["links"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["title"] = title;
    data["event_date_utc"] = eventDateUtc;
    data["event_date_unix"] = eventDateUnix;
    data["flight_number"] = flightNumber;
    data["details"] = details;
    if (linksHistory != null) {
      data["links"] = linksHistory!.toJson();
    }
    return data;
  }
}
