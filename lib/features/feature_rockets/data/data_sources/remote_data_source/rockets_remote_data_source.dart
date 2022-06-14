import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_rockets/data/models/rockets_data_model.dart';

abstract class RocketRemoteDataSource {
  Future<List<RocketDataModel>> getRocketsDetails();
}

class RocketsRemoteDataSourceImpl implements RocketRemoteDataSource {
  final http.Client client;

  RocketsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RocketDataModel>> getRocketsDetails() async {
    var response = await client.get(Uri.parse(rockets_url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data
          .map<RocketDataModel>((json) => RocketDataModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
