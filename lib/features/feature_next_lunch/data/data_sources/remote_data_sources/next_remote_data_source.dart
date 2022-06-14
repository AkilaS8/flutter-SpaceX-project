import 'dart:convert';

import 'package:space_x/core/constants/api_list.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/features/feature_next_lunch/data/models/next_data_model.dart';
import 'package:http/http.dart' as http;

abstract class NextRemoteDataSource{
  Future<NextLaunchDataModel> getNextDetails();
}

class NextRemoteDataSourceImpl implements NextRemoteDataSource {
  final http.Client client;

  NextRemoteDataSourceImpl({required this.client});


  @override
  Future<NextLaunchDataModel> getNextDetails() async{
    var response = await client.get(Uri.parse(Next_Url));
    if (response.statusCode == 200) {
      var data = NextLaunchDataModel.fromJson(jsonDecode(response.body));
      //print(data);
      return data;

    } else {
      throw ServerException();
    }
  }
}