import 'package:flutter/material.dart';
import 'package:pagelistdata/model/suninfotech_page_model.dart';

class BuildListTileExpansion extends StatelessWidget {
  const BuildListTileExpansion({
    Key key,
    @required this.data,
    @required this.index,
  }) : super(key: key);

  final List<PageDataModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    print('index is: ' + index.toString());

    return ExpansionTile(
        key: PageStorageKey<PageDataModel>(data[index]),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'GrnNO : ' + data[index].grnNo,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        expandedAlignment: Alignment.topCenter,
        backgroundColor: Colors.blue[200],
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  Text(
                    'Fabric : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(data[index].fabric),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  Text(
                    'Color : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(data[index].color),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  Text(
                    'DyedcNo : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(data[index].dyedcNo),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  Text(
                    'DYEINGNAME : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(data[index].dyeingName),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  Text(
                    'ROLLS : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(data[index].rolls),
                ],
              ),
            ],
          )
        ]);
  }
}
