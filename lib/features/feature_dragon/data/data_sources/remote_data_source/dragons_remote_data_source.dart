import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_dragon/data/models/dargon_data_model.dart';
import 'package:http/http.dart' as http;

abstract class DragonRemoteDataSource {
  Future<List<DragonDataModel>> getDragonsDetails();
}

class DragonsRemoteDataSourceImpl implements DragonRemoteDataSource {
  final http.Client client;

  DragonsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DragonDataModel>> getDragonsDetails() async{
    var response = await client.get(Uri.parse(dragons_url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data
          .map<DragonDataModel>((json) => DragonDataModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }


}