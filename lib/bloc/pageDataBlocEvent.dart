import 'package:equatable/equatable.dart';

class PageDataBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPageDataEvent extends PageDataBlocEvent {
  final String fromDate;
  final String toDate;
  final int startingPgNo;
  final int endingPgNo;
  FetchPageDataEvent(
      this.fromDate, this.toDate, this.startingPgNo, this.endingPgNo);
  @override
  List<Object> get props => [fromDate, toDate, startingPgNo, endingPgNo];
}

class FetchCurrentDateEvent extends PageDataBlocEvent {
  final DateTime dateTime;
  FetchCurrentDateEvent(this.dateTime);
  @override
  List<Object> get props => [dateTime];
}
