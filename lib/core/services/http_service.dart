import 'package:dio/dio.dart';

class HttpService {
  Dio _dio = Dio();

  HttpService() {
    var baseUrl = "https://api.sanalira.com/assignment";

    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<Response> getRequest() async {
    Response response;
    try {
      response = await _dio.get("");
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
