import 'package:flutter/material.dart';
import 'package:flutterapp/demo_natigator/screen_third.dart';

class ScreenSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get data using RoutSetting -> Chỉ áp dụng với push named bth.
    RouteSettings settings = ModalRoute.of(context).settings;
    var content = settings.arguments;

    print(content);
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            //Simple
//            Route route = MaterialPageRoute(builder: (context) => ScreenThird());
//            Navigator.push(context, route);
            //Named
            Navigator.pushNamed(context, "/third");
          },
          child: Text('Go To Screen Three'),
        ),
      ),
    );
  }
}
