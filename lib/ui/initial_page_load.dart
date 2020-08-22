import 'package:flutter/material.dart';

class InitialPageLoad extends StatelessWidget {
  const InitialPageLoad({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Center(
            child: Text(
              'Please select From date and \nTo Date to generate report!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
