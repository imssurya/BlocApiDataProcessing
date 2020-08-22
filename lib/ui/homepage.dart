import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagelistdata/bloc/pageDataBloc.dart';
import 'package:pagelistdata/bloc/pageDataBlocEvent.dart';
import 'package:pagelistdata/bloc/pageDataBlocState.dart';
import 'package:pagelistdata/model/suninfotech_page_model.dart';
import 'package:pagelistdata/ui/initial_page_load.dart';
import 'package:pagelistdata/ui/loading_widget.dart';

import 'expansion_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageDataBloc _pageDataBloc;
  final _pageController = PageController(initialPage: 0);
  var _textField1Controller = TextEditingController();
  var _textField2Controller = TextEditingController();
  var _pgNoController = TextEditingController();
  @override
  void initState() {
    _pageDataBloc = BlocProvider.of<PageDataBloc>(context);
    //pageDataBloc.add(FetchPageDataEvent('2000-01-01', '2020/01/01'));
    super.initState();
    //pageDataBloc = BlocProvider.of<PageDataBloc>(context);
    //pageDataBloc.add(FetchPageDataEvent('2000-01-01', '2020/01/01'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('SunTechInfo'),
      ),
      body: BlocBuilder<PageDataBloc, PageDataBlocState>(
        builder: (context, state) {
          if (state is PageDataNotSearch) {
            return mainPage(initialPageLoad: true);
          } else if (state is PageDataIsLoading) {
            return LodingWidget(context: context);
          } else if (state is PageDataLoaded) {
            //print(state.props.length);
            final List<PageDataModel> data =
                state.pageDataListModel.pageDataList;
            // data.forEach((element) {
            //   print(element.color);
            // });

            return mainPage(
              initialPageLoad: false,
              data: data,
            );
          } else {
            print(state);
            return Text('Something Wrong dood');
          }
        },
      ),
    );
  }

  Widget mainPage({@required bool initialPageLoad, List<PageDataModel> data}) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                  child: TextField(
                    readOnly: true,
                    showCursor: true,
                    controller: _textField1Controller,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'From date',
                    ),
                    onTap: () async {
                      final DateTime date = await selectDate(context);
                      _textField1Controller.text =
                          date.toString().substring(0, 10);
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                // Padding(
                //   padding: EdgeInsets.all(10.0),
                // ),
                Flexible(
                  child: TextField(
                    readOnly: true,
                    showCursor: true,
                    controller: _textField2Controller,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'To date',
                    ),
                    onTap: () async {
                      final DateTime date = await selectDate(context);
                      _textField2Controller.text =
                          date.toString().substring(0, 10);
                      // setState(() {
                      //   _textField2Controller.text =
                      //       date.toString().substring(0, 10);
                      // });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SizedBox(
                      height: 45,
                      child: RaisedButton(
                        color: Colors.red[100],
                        shape: StadiumBorder(),
                        onPressed: () {
                          _pageDataBloc.add(FetchPageDataEvent(
                              _textField1Controller.text,
                              _textField2Controller.text,
                              1,
                              10));
                        },
                        child: Text(
                          "Generate Report",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                  flex: 3,
                  child: TextField(
                    showCursor: false,
                    textAlign: TextAlign.center,
                    controller: _pgNoController,
                    keyboardType: TextInputType.number,
                    onTap: () {
                      setState(() {
                        _pgNoController.text = "";
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Pg No',
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SizedBox(
                      height: 45,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        color: Colors.red[100],
                        onPressed: () {
                          _pageController
                              .jumpToPage(int.parse(_pgNoController.text) - 1);
                        },
                        child: Text(
                          "Go",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            initialPageLoad ? InitialPageLoad() : buildPageView(context, data),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView(BuildContext context, List<PageDataModel> data) {
    return Expanded(
      flex: 1,
      child: PageView.builder(
        pageSnapping: true,
        itemBuilder: (BuildContext context, int index) {
          var multiplier = 0;
          var limit = data.length / 10 <= 1
              ? 1
              : int.parse((data.length / 10).ceil().toString());
          multiplier = index == 0 ? 1 : index;
          var buildData = index;
          return ListView.builder(
            itemCount: limit - 1 == index ? data.length % 10 : 10,
            itemBuilder: (context, gridIndex) {
              return BuildListTileExpansion(
                  data: data,
                  index: buildData == 0
                      ? gridIndex
                      : gridIndex + (10 * multiplier) <= data.length
                          ? gridIndex + 10 * multiplier
                          : data.length);
            },
          );
        },
        itemCount: data.length / 10 <= 1
            ? 1
            : int.parse((data.length / 10).ceil().toString()),
        controller: (_pageController),
        onPageChanged: (num) {
          setState(() {
            int a = data.length / 10 <= 1
                ? 1
                : int.parse((data.length / 10).ceil().toString());
            _pgNoController.text = (num + 1).toString() + "/" + a.toString();
            //  _pageDataBloc.add(FetchPageDataEvent(
            //     _textField1Controller.text, _textField2Controller.text, 1, 10));
          });
          print(num);
        },
      ),
    );
  }

  Future<DateTime> selectDate(BuildContext context) async {
    DateTime dateTime = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != dateTime) {
      dateTime = picked;
    }
    return dateTime;
  }
}
