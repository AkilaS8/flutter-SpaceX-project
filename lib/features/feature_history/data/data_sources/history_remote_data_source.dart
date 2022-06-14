import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_history/data/models/history_data_model.dart';
import 'package:http/http.dart' as http;


abstract class HistoryRemoteDataSource {
  Future<List<HistoryDataModel>> getHistoryDetails();
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  final http.Client client;

  HistoryRemoteDataSourceImpl({required this.client});


  @override
  Future<List<HistoryDataModel>> getHistoryDetails() async {
    var response = await client.get(Uri.parse(history_url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data
          .map<HistoryDataModel>((json) => HistoryDataModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}