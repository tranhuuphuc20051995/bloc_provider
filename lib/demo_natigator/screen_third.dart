import 'package:flutter/material.dart';
import 'package:flutterapp/demo_natigator/screen_four.dart';

class ScreenThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Third'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            //Simple
//            Route route = MaterialPageRoute(builder: (context) => ScreenFour());
//            Navigator.push(context, route);
          //Named
            Navigator.pushNamed(context, "/four");
          },
          child: Text('Go To Screen Four'),
        ),
      ),
    );
  }
}
