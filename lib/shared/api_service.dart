import 'package:dio/dio.dart';
import 'package:flutter_learning_demo/shared/api_constants.dart';

class APIService {
  // APIService._internal();
  //
  // static final APIService _instance = APIService._internal();
  //
  // factory APIService() => _instance;

  get dio => Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.baseUrl = APIConstants.baseURL;
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          // await Future.delayed(Duration(seconds: 10));
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          switch (e.response?.statusCode) {
            case 301:
              break;
            case 401:
              break;
            default:
          }
          return handler.next(e);
        },
      ),
    );
}
