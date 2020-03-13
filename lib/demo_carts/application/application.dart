import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/blocs/cart_bloc.dart';
import 'package:flutterapp/demo_carts/models/coin.dart';
import 'package:flutterapp/demo_carts/uis/cart/my_cart_page.dart';
import 'package:flutterapp/demo_carts/uis/product/products_page.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../main.dart';

class ProductBlocProviderApp extends StatefulWidget {
  //C1: Khoi tao bloc trong init.
  //Chuyển state less sang stateful để có hàm init

  @override
  _ProductBlocProviderAppState createState() => _ProductBlocProviderAppState();
}

class _ProductBlocProviderAppState extends State<ProductBlocProviderApp> {
  CartBloc cartBloc;
  Coin coinModel;

  @override
  void initState() {
    coinModel = Coin();
    cartBloc = CartBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<Coin>(
      model: coinModel,
      child: MaterialApp(
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
                  creator: (_context, _bag) => cartBloc,
                  child: ProductsPage.newInstance(),
                ),
            '/cart': (context) => BlocProvider.fromBloc(
                  bloc: cartBloc,
                  child: CartPage(),
                ),
          }),
    );
  }
}
