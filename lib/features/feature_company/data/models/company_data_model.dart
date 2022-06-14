import 'package:space_x/features/feature_company/domain/entities/response/company_data_entity.dart';

class CompanyDataModel extends CompanyDataModelEntity {
String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launchSites;
  int? testSites;
  String? ceo;
  String? cto;
  String? coo;
  String? ctoPropulsion;
  int? valuation;
  String? summary;

  CompanyDataModel({
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.vehicles,
    this.launchSites,
    this.testSites,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.valuation,
    this.summary,
  }): super(
    name: name,
    founder: founder,
    founded: founded,
    employees: employees,
    vehicles: vehicles,
    launchSites: launchSites,
    testSites: testSites,
    ceo: ceo,
    cto: cto,
    coo: coo,
    ctoPropulsion: ctoPropulsion,
    valuation: valuation,
    summary: summary,
  );
  CompanyDataModel.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    founder = json["founder"]?.toString();
    founded = json["founded"]?.toInt();
    employees = json["employees"]?.toInt();
    vehicles = json["vehicles"]?.toInt();
    launchSites = json["launch_sites"]?.toInt();
    testSites = json["test_sites"]?.toInt();
    ceo = json["ceo"]?.toString();
    cto = json["cto"]?.toString();
    coo = json["coo"]?.toString();
    ctoPropulsion = json["cto_propulsion"]?.toString();
    valuation = json["valuation"]?.toInt();
    summary = json["summary"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["founder"] = founder;
    data["founded"] = founded;
    data["employees"] = employees;
    data["vehicles"] = vehicles;
    data["launch_sites"] = launchSites;
    data["test_sites"] = testSites;
    data["ceo"] = ceo;
    data["cto"] = cto;
    data["coo"] = coo;
    data["cto_propulsion"] = ctoPropulsion;
    data["valuation"] = valuation;
    data["summary"] = summary;
    return data;
  }
}
