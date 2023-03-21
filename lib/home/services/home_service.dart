import 'dart:convert';

import 'package:flutter_learning_demo/home/model/product.dart';
import 'package:flutter_learning_demo/shared/api_constants.dart';
import 'package:flutter_learning_demo/shared/api_service.dart';

class HomeService extends APIService {
  HomeService._internal();

  static final HomeService _instance = HomeService._internal();

  factory HomeService() => _instance;

  Future<List<Product>> getProduct() async {
    final response = await super.dio.get(APIConstants.product);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }
  
}