import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:laborator_5/data/details/models/index.dart';

abstract class DetailsApiDataSource {
  Future<DetailApiDto> getDetails(int id);
}

class Failure {
  final dynamic error;
  const Failure(this.error);
}

class DetailsApiDataSourceImpl implements DetailsApiDataSource {
  @override
  Future<DetailApiDto> getDetails(int id) async {
      Uri uri =
          Uri.parse("http://mobile-shop-api.hiring.devebs.net/products/$id");
      var response = await http.get(uri, headers: {});
      return  DetailApiDto.fromJson(jsonDecode(response.body));
  }
}
