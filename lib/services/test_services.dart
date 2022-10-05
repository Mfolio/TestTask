import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test1/model/test_modul.dart';

class GetApi {
  final Dio _dio = Dio();
  final String url = 'https://rickandmortyapi.com/api/character/';

  Future<DataModel> getData() async {
    try {
      Response response = await _dio.get(url);
      return DataModel.fromJson(response.data);
    } catch (e,stacktrace) {
      if (kDebugMode) {
        print('Exception ocurred: $e stackTrace: $stacktrace');
      }
      return DataModel.withError('Data not found');
    }
  }
}
