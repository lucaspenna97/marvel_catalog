import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermarvelcatalog/utils/strings.dart';

class ErrorPage extends StatelessWidget {
  final Function function;

  ErrorPage({this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings.SOMETHING_WENT_WRONG,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Strings.SAD_FACE,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            color: Colors.transparent,
            onPressed: function,
            child: Text(
              Strings.TRY_AGAIN,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
