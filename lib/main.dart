import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_natigator/screen_four.dart';
import 'package:flutterapp/demo_natigator/screen_second.dart';
import 'package:flutterapp/demo_natigator/screen_third.dart';

import 'demo_api_dio/api/screen/test_api_screen.dart';
import 'demo_counter_bloc_provider/count_bloc.dart';
import 'demo_counter_bloc_provider/ui_counter_bloc_provider.dart';
import 'demo_natigator/screen_first.dart';

void main() => runApp(ApiScreen.newInstance());

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class CounterBlocProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        creator: (_context, _bag) => CounterBloc(),
        child: CounterBlocProviderPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

//Simple Navigator using push route and pop.
class MyNavigatorDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      home: ScreenFirst(),
    );
  }
}

//Navigator using named
class MyNavigatorNamed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => ScreenFirst(),
        '/second': (context) => ScreenSecond(),
        '/third': (context) => ScreenThird(),
        '/four': (context) => ScreenFour(),
      },
      onUnknownRoute: (RouteSettings setting) {
        //If not fount route
        return new MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Not Found Page"),
      ),
    );
  }
}

//Navigator using onGenerateRoute
class NavigatorOnGenerateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenFirst(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return SlideRightRoute(widget: ScreenFirst());
            break;
          case '/second':
            return SlideRightRoute(widget: ScreenSecond());
            break;
          case '/third':
            return SlideRightRoute(widget: ScreenThird());
            break;
          case '/four':
            return SlideRightRoute(widget: ScreenFour());
            break;
        }
      },
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
