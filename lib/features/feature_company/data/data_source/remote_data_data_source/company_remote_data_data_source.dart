import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_company/data/models/company_data_model.dart';
import 'package:http/http.dart' as http;

abstract class CompanyRemoteDataSource {
  Future<CompanyDataModel> getCompanyDetails();
}

class CompanyRemoteDataSourceImpl extends CompanyRemoteDataSource {
  final http.Client client;

  CompanyRemoteDataSourceImpl({required this.client});

  @override
  Future<CompanyDataModel> getCompanyDetails() async {
    var response = await client.get(Uri.parse(company_url));
    if (response.statusCode == 200) {
      var data = CompanyDataModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw ServerException();
    }
  }

}