import 'package:flutter/material.dart';
import 'package:flutterapp/demo_natigator/screen_second.dart';

class ScreenFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            //Go to screen second
            //Simple
//            Route route = MaterialPageRoute(builder: (context) => ScreenSecond());
//            Navigator.push(context, route);
            //Named
            Navigator.pushNamed(context, "/second");
            //Send Data
//            Navigator.pushNamed(context, "/second", arguments: "hello");
            //Replacement
//            Route route =
//                MaterialPageRoute(builder: (context) => ScreenSecond());
//            Navigator.pushReplacement(context, route);
//            Route route =
//                MaterialPageRoute(builder: (context) => ScreenSecond());
//            Navigator.pushAndRemoveUntil(context, route, ModalRoute.withName('/second'),);

          },
          child: Text('Second One'),
        ),
      ),
    );
  }
}
