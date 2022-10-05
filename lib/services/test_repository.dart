import 'package:test1/model/test_modul.dart';
import 'package:test1/services/test_services.dart';

class ApiRepository {
  final _provider = GetApi();

  Future<DataModel> getData() {
    return _provider.getData();
  }
}

class NetworkError extends Error {}
