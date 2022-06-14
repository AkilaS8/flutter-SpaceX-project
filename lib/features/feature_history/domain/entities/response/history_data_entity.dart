
class HistoryDataModelLinksEntity {

  String? article;
  String? wikipedia;

  HistoryDataModelLinksEntity({
    this.article,
    this.wikipedia,
  });

}

class HistoryDataModelEntity {

  int? id;
  String? title;
  String? eventDateUtc;
  int? eventDateUnix;
  int? flightNumber;
  String? details;
  HistoryDataModelLinksEntity? links;

  HistoryDataModelEntity({
    this.id,
    this.title,
    this.eventDateUtc,
    this.eventDateUnix,
    this.flightNumber,
    this.details,
    this.links,
  });


}
