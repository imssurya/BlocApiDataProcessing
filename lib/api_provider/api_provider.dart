import 'dart:convert';

import 'package:pagelistdata/model/suninfotech_page_model.dart';

import 'package:http/http.dart' as http;

class ApiProvider {
  String baseUrl =
      "http://prs.suninfotechnologies.in/api/inward?pagenumber=1&pagesize=35&";
  final successCode = 200;

  Future<PageDataListModel> fetchPageData(
      String fromDate, String toDate, int startpg, int endPg) async {
    print(baseUrl +
        "pagenumber=" +
        startpg.toString() +
        "&pagesize=" +
        endPg.toString() +
        "&fromdate=" +
        fromDate +
        "&todate=" +
        toDate +
        "&compid=1");
    final response = await http.Client().get(
        baseUrl + "fromdate=" + fromDate + "&todate=" + toDate + "&compid=1");
    print(response.statusCode);
    if (response.statusCode != successCode) {
      print("error occured");
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
