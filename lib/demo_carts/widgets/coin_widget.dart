import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/models/coin.dart';
import 'package:scoped_model/scoped_model.dart';

class CoinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: ScopedModelDescendant<Coin>(
          builder: (context, child, model) => Text('${model.money}'),
        ),
      ),
    );
  }
}
