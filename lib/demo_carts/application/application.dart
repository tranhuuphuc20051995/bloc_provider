import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/blocs/cart_bloc.dart';
import 'package:flutterapp/demo_carts/uis/cart/my_cart_page.dart';
import 'package:flutterapp/demo_carts/uis/product/products_page.dart';

import '../../main.dart';

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
        navigatorObservers: [routeObserver],
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider<CartBloc>(
                creator: (_context, _bag) => CartBloc(),
                child: ProductsPage.newInstance(),
              ),
          '/cart': (context) => CartPage(),
        });
  }
}
