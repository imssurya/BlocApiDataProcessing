import 'dart:convert';

import 'package:pagelistdata/model/suninfotech_page_model.dart';

import 'package:http/http.dart' as http;

class ApiProvider {
  String baseUrl =
      "http://prs.suninfotechnologies.in/api/inward?pagenumber=1&pagesize=35&";
  final successCode = 200;

  Future<PageDataListModel> fetchPageData(
      String fromDate, String toDate, int startpg, int endPg) async {
    final response = await http.Client().get(
        baseUrl + "fromdate=" + fromDate + "&todate=" + toDate + "&compid=1");
    if (response.statusCode != successCode) {
      throw Exception();
    }
    return parsedJson(response.body);
  }

  PageDataListModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    return PageDataListModel.fromJson(jsonDecoded);
  }
}

class DataTimeProvider {
  final DateTime selectedDate = DateTime.now();
}
