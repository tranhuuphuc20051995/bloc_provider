import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/uis/cart/my_cart_page.dart';
import 'package:flutterapp/demo_carts/uis/product/products_page.dart';

import 'demo_counter_bloc_provider/count_bloc.dart';
import 'demo_counter_bloc_provider/ui_counter_bloc_provider.dart';

void main() => runApp(ProductBlocProviderApp());

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

class ProductBlocProviderApp extends StatelessWidget {
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
      home: ProductsPage(),
      navigatorObservers: [routeObserver],
//      BlocProvider<CounterBloc>(
//        creator: (_context, _bag) => CounterBloc(),
//        child: CounterBlocProviderPage(title: 'Flutter Demo Home Page'),
//      ),
    );
  }
}
