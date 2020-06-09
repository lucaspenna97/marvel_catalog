import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          )
        ],
      ),
    );
  }
}
