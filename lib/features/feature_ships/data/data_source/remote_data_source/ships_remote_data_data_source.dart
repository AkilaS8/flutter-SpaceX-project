import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_ships/data/models/ship_data_model.dart';
import 'package:http/http.dart' as http;

abstract class ShipsRemoteDataSource {
  Future<List<ShipDataModel>> getShipsDetails();
}

class ShipsRemoteDataSourceImpl extends ShipsRemoteDataSource{
  final http.Client client;

  ShipsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ShipDataModel>> getShipsDetails() async{
    var response = await client.get(Uri.parse(ships_url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data
          .map<ShipDataModel>((json) => ShipDataModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }

}