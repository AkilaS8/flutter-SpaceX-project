import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_launches_upcoming/data/models/upcoming_data_model.dart';
import 'package:http/http.dart' as http;

abstract class UpcomingRemoteDataSource{
  Future<List<UpcomingDataModel>> getUpcomingDetails();
}

class UpcomingRemoteDataSourceImpl implements UpcomingRemoteDataSource {
  final http.Client client;

  UpcomingRemoteDataSourceImpl({required this.client});


  @override
  Future<List<UpcomingDataModel>> getUpcomingDetails() async{
    var response = await client.get(Uri.parse(upcoming_url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data);
      return data
          .map<UpcomingDataModel>((json) => UpcomingDataModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}