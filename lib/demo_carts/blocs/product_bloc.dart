import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutterapp/demo_carts/models/product.dart';
import 'package:flutterapp/demo_carts/repository/product_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc implements Bloc {
  BehaviorSubject _productsController = BehaviorSubject<List<Product>>();

  ValueStream<List<Product>> get productsStream => _productsController.stream;

  @override
  void dispose() {
    _productsController.close();
  }

  Future<void> getCount() async {
    await ProductRepository().getProducts(onSuccess: (listProduct) {
      _productsController.add(listProduct);
    });
  }
}
