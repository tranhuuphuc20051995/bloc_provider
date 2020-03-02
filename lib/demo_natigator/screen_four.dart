import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Four'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            //Simple
//            Navigator.of(context).pop();
          //Named -> Pop và push named new page.
//            Navigator.of(context).popAndPushNamed("/");
          },
          child: Text('Back To'),
        ),
      ),
    );
  }
}
