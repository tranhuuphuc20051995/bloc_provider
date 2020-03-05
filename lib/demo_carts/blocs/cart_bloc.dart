import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutterapp/demo_carts/models/product.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc implements Bloc {
  BehaviorSubject<List<Product>> _cart = BehaviorSubject<List<Product>>.seeded([]);
  BehaviorSubject<int> _itemCount = BehaviorSubject<int>.seeded(0);
  StreamController _cartAdditionController = StreamController<Product>();


  ValueStream<List<Product>> get cartStream => _cart.stream;
  ValueStream<int> get itemCount => _itemCount.distinct().shareValueSeeded(_itemCount.value);

  @override
  void dispose() {
    _cart.close();
    _itemCount.close();
    _cartAdditionController.close();
  }

  void addProductToCart(Product product) {
    _cart.value.add(product);
    _itemCount.add(_cart.value.length);
    print('${_cart.value.length}');
  }
}
