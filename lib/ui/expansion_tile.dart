import 'package:flutter/material.dart';
import 'package:pagelistdata/model/suninfotech_page_model.dart';
import 'package:pagelistdata/utilities/size_config.dart';

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
    // print('index is: ' + index.toString());

    return ExpansionTile(
        key: PageStorageKey<PageDataModel>(data[index]),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GrnNO : ' + data[index].grnNo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 3 * SizeConfig.textMultiplier),
              ),
              Text(
                'DateTime : ' + (data[index].dateTime).substring(0, 9),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 2.25 * SizeConfig.textMultiplier),
              ),
            ],
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
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 25),
                  ),
                  Text(
                    'Fabric : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                  Text(data[index].fabric,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier)),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 25),
                  ),
                  Text(
                    'Color : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                  Text(data[index].color,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier)),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 25),
                  ),
                  Text(
                    'DyedcNo : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                  Text(data[index].dyedcNo,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier)),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 25),
                  ),
                  Text(
                    'DYEINGNAME : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                  Text(data[index].dyeingName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier)),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 25),
                  ),
                  Text(
                    'ROLLS : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                  Text(data[index].rolls,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier)),
                ],
              ),
            ],
          )
        ]);
  }
}
