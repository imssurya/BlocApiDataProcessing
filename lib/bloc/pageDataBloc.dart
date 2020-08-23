import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagelistdata/bloc/pageDataBlocEvent.dart';
import 'package:pagelistdata/bloc/pageDataBlocState.dart';
import 'package:pagelistdata/model/suninfotech_page_model.dart';
import 'package:pagelistdata/repository_provider/repository_provider.dart';

class PageDataBloc extends Bloc<PageDataBlocEvent, PageDataBlocState> {
  final RepositoryDataProvider _repositoryDataProvider;

  PageDataBloc({@required RepositoryDataProvider repositoryDataProvider})
      : assert(repositoryDataProvider != null),
        _repositoryDataProvider = repositoryDataProvider,
        super(PageDataNotSearch());
  @override
  Stream<PageDataBlocState> mapEventToState(PageDataBlocEvent event) async* {
    if (event is FetchPageDataEvent) {
      //PageDataListModel dataAPI;
      yield PageDataIsLoading();
      //PageDataListModel dataAPI;
      try {
        final PageDataListModel pageDataListModel =
            await _repositoryDataProvider.fetchPageDataFromAPI(event.fromDate,
                event.toDate, event.startingPgNo, event.endingPgNo);
        print(pageDataListModel.pageDataList.length);
        yield PageDataLoaded(pageDataListModel: pageDataListModel);

        // tried below code to get lazy loading
        // try {
        //   if (event.endingPgNo <= 10) {
        //     dataAPI = await _repositoryDataProvider.fetchPageDataFromAPI(
        //         event.fromDate,
        //         event.toDate,
        //         event.startingPgNo,
        //         event.endingPgNo);
        //     yield PageDataLoaded(pageDataListModel: dataAPI);
        //   } else if (event.endingPgNo > 10) {
        //     // final PageDataListModel pageDataListModel =
        //     //     await _repositoryDataProvider.fetchPageDataFromAPI(event.fromDate,
        //     //         event.toDate, event.startingPgNo, event.endingPgNo);

        //     dataAPI = await _repositoryDataProvider.fetchPageDataFromAPI(
        //         event.fromDate,
        //         event.toDate,
        //         event.startingPgNo,
        //         event.endingPgNo);
        //     PageDataListModel s = dataAPI.pageDataList
        //         .sublist(event.endingPgNo, 20) as PageDataListModel;

        //     print(s.pageDataList.length);
        //     yield PageDataLoaded(pageDataListModel: s);
        //   }
      } catch (e) {
        yield PageDataNotLoaded();
      }
    }
  }
}
