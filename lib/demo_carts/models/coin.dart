import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Coin extends Model {
  int _money = 1000;

  String get money => _money.toString();

  void payment(int totalPrice) {
    if (_money > totalPrice) {
      _money = _money - totalPrice;
      notifyListeners();
    }
  }

  static Coin of(BuildContext context) => ScopedModel.of<Coin>(context);
}
