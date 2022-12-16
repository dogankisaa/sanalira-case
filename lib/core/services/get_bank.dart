import 'package:dio/dio.dart';
import 'package:sanalira_case/core/services/http_service.dart';

class GetBanks {
  Future getBanks() async {
    HttpService http = HttpService();
    Response? response;
    response = await http.getRequest();
    if (response.statusCode == 200) {
      final map = Map<String, dynamic>.from(response.data);

      return map["data"];
    } else {
      throw Exception("Something went wrong!");
    }
  }
}
