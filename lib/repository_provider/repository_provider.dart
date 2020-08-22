import 'package:pagelistdata/api_provider/api_provider.dart';
import 'package:pagelistdata/model/suninfotech_page_model.dart';

class RepositoryDataProvider {
  ApiProvider _apiProvider = ApiProvider();
  DataTimeProvider _dataTimeProvider = DataTimeProvider();

  Future<PageDataListModel> fetchPageDataFromAPI(
      String fromDate, String toDate, int startingPgNo, int endingPgNo) async {
    // PageDataListModel dataAPI = await _apiProvider.fetchPageData(
    //   fromDate, toDate, startingPgNo, endingPgNo);
    // need to implement latest data logic;
    //int pageValue = endingPgNo;

    return _apiProvider.fetchPageData(
        fromDate, toDate, startingPgNo, endingPgNo);
  }

  DateTime fetchCurrentDateTime() => _dataTimeProvider.selectedDate;
}
