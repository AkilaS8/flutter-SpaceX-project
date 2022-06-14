import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_launches_past/data/models/past_data_model.dart';
import 'package:http/http.dart' as http;

abstract class PastRemoteDataSource{
  Future<List<PastDataModel>> getPastDetails();
}

class PastRemoteDataSourceImpl extends PastRemoteDataSource{
  final http.Client client;

  PastRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PastDataModel>> getPastDetails() async{
    var response = await client.get(Uri.parse(Past_Url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data);
      return data
          .map<PastDataModel>((json) => PastDataModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }

}