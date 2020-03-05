import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/uis/product/products_page.dart';

import '../../../main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with RouteAware{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
          ),
          centerTitle: true,
        ),
        body: Text(
          'Cart',
        )
//        ListView.builder(
//          itemCount: list.length,
//          itemBuilder: (context, index) {
//            return Container(
//              alignment: Alignment.center,
//              margin: EdgeInsets.all(5),
//              color: Colors.deepPurple,
//              child: Text(list[index]),
//            );
//          },
//        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
