import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pagelistdata/model/suninfotech_page_model.dart';

class PageDataBlocState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PageDataNotSearch extends PageDataBlocState {
  static void printText() {
    print('im a initial state');
  }
}

class PageDataIsLoading extends PageDataBlocState {}

class PageDataLoaded extends PageDataBlocState {
  final PageDataListModel pageDataListModel;
  PageDataLoaded({@required this.pageDataListModel})
      : assert(pageDataListModel != null);
  @override
  List<Object> get props => [pageDataListModel];
}

class PageDataNotLoaded extends PageDataBlocState {}
