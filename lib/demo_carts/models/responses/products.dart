import '../product.dart';

class Products {
  List<Product> _products;

  Products({List<Product> products}) {
    this._products = products;
  }

  List<Product> get products => _products;

  set products(List<Product> products) => _products = products;

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = new List<Product>();
      json['products'].forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
