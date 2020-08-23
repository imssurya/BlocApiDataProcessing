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
import 'package:pagelistdata/utilities/size_config.dart';

import 'expansion_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageDataBloc _pageDataBloc;
  int listItemController = 1;
  final _pageController = PageController(initialPage: 0);
  var _textField1Controller = TextEditingController();
  var _textField2Controller = TextEditingController();
  var _pgNoController = TextEditingController();
  bool initialPageLoad = true;
  bool txt1 = false;
  bool txt2 = false;
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  SizeConfig().init(constraints, orientation);
                  return BlocBuilder<PageDataBloc, PageDataBlocState>(
                    builder: (context, state) {
                      print("textMultiplier " +
                          SizeConfig.textMultiplier.toString());
                      print("imageSizeMultiplier " +
                          SizeConfig.textMultiplier.toString());
                      print("heightMultiplier " +
                          SizeConfig.textMultiplier.toString());
                      print("widthMultiplier " +
                          SizeConfig.textMultiplier.toString());

                      if (state is PageDataNotSearch) {
                        return mainPage(
                            initialPageLoad: initialPageLoad, context: context);
                      } else if (state is PageDataIsLoading) {
                        return LodingWidget(context: context);
                      } else if (state is PageDataLoaded) {
                        final List<PageDataModel> data =
                            state.pageDataListModel.pageDataList;
                        // setState(() {
                        //   return mainPage(
                        //     initialPageLoad: false,
                        //     data: data,
                        //   );
                        // });

                        initialPageLoad = false;

                        return mainPage(
                            initialPageLoad: initialPageLoad,
                            data: data,
                            context: context);
                      } else {
                        print(state);
                        return Container(
                            alignment: Alignment.center,
                            child: Center(
                                child: Text(
                                    'Something Went Wrong Please Rerun Application')));
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget mainPage(
      {@required bool initialPageLoad,
      List<PageDataModel> data,
      @required BuildContext context}) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig.widthMultiplier,
                ),
                Flexible(
                  child: TextField(
                    readOnly: true,
                    showCursor: true,
                    controller: _textField1Controller,
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(
                        fontSize: SizeConfig.isPortrait
                            ? SizeConfig.textMultiplier * 3
                            : SizeConfig.textMultiplier * 3),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.widthMultiplier * 3),
                      ),
                      hintText: 'From date',
                    ),
                    onTap: () async {
                      final DateTime date = await selectDate(context);
                      _textField1Controller.text =
                          date.toString().substring(0, 10);
                      txt1 = true;
                    },
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
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
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 3),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.widthMultiplier * 3),
                      ),
                      hintText: 'To date',
                    ),
                    onTap: () async {
                      final DateTime date = await selectDate(context);
                      _textField2Controller.text =
                          date.toString().substring(0, 10);
                      txt2 = true;
                    },
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SizedBox(
                      height: SizeConfig.heightMultiplier * 8,
                      child: RaisedButton(
                        color: Colors.red[100],
                        shape: StadiumBorder(),
                        onPressed: () {
                          if (txt1 == true &&
                              txt2 == true &&
                              _textField1Controller.text !=
                                  _textField2Controller.text) {
                            _pageDataBloc.add(FetchPageDataEvent(
                                _textField1Controller.text,
                                _textField2Controller.text,
                                1,
                                10));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Please enter From Date and To Date!"),
                            ));
                          }
                        },
                        child: Text(
                          "Generate Report",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 3),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier,
                ),
                Flexible(
                  flex: 3,
                  child: TextField(
                    showCursor: false,
                    textAlign: TextAlign.center,
                    controller: _pgNoController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 3),
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
                        borderRadius: BorderRadius.circular(
                            SizeConfig.widthMultiplier * 9),
                      ),
                      hintText: 'Pg No',
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 1,
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SizedBox(
                      height: SizeConfig.heightMultiplier * 8,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        color: Colors.red[100],
                        onPressed: () {
                          _pageController
                              .jumpToPage(int.parse(_pgNoController.text) - 1);
                        },
                        child: Text(
                          "Go",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 3),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
                ),
              ],
            ),
            initialPageLoad ? InitialPageLoad() : buildPageView(context, data),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView(BuildContext context, List<PageDataModel> data) {
    return Container(
      child: Expanded(
        child: PageView.builder(
          pageSnapping: true,
          itemBuilder: (context, int index) {
            var multiplier = 0;
            var limit = data.length / 10 <= 1
                ? 1
                : int.parse((data.length / 10).ceil().toString());
            multiplier = index == 0 ? 1 : index;
            var buildData = index;
            return ListView.builder(
              itemCount: limit - 1 == index
                  ? data.length % 10 == 0 ? 10 : data.length % 10
                  : 10,
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
            //listItemController++;
            setState(() {
              int a = data.length / 10 <= 1
                  ? 1
                  : int.parse((data.length / 10).ceil().toString());
              _pgNoController.text = (num + 1).toString() + "/" + a.toString();
            });
            print(num);
          },
        ),
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
