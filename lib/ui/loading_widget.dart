import 'package:flutter/material.dart';

class LodingWidget extends StatelessWidget {
  const LodingWidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
