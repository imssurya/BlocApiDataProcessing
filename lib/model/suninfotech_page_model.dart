import 'dart:core';

class PageDataListModel {
  final List<PageDataModel> pageDataList;

  PageDataListModel({
    this.pageDataList,
  });

  factory PageDataListModel.fromJson(List<dynamic> parsedJson) {
    List<PageDataModel> pageDataList = List<PageDataModel>();
    pageDataList = parsedJson.map((i) => PageDataModel.fromJson(i)).toList();
    return PageDataListModel(pageDataList: pageDataList);
  }
}

class PageDataModel {
  final String grnNo;
  final String dateTime;
  final String ptyName;
  final String dyedcNo;
  final String dyeingName;
  final String partydcNo;
  final String partydcRoll;
  final String partydcWeight;
  final String fabric;
  final String color;
  final String dia;
  final String rolls;
  final String totkgs;

  PageDataModel(
      {this.grnNo,
      this.dateTime,
      this.ptyName,
      this.dyedcNo,
      this.dyeingName,
      this.partydcNo,
      this.partydcRoll,
      this.partydcWeight,
      this.fabric,
      this.color,
      this.dia,
      this.rolls,
      this.totkgs});

  factory PageDataModel.fromJson(Map<String, dynamic> json) {
    return PageDataModel(
      grnNo: json['GRNNO'],
      dateTime: json['DATE'],
      ptyName: json['PTYNAME'],
      dyedcNo: json['DYEDCNO'],
      dyeingName: json['DYEINGNAME'],
      partydcNo: json['PARTYDCNO'],
      partydcRoll: json['PARTYDCROLL'],
      partydcWeight: json['PARTYDCWEIGHT'],
      fabric: json['FABRIC'],
      color: json['COLOR'],
      dia: json['DIA'],
      rolls: json['ROLLS'],
      totkgs: json['TOTKGS'],
    );
  }
}
