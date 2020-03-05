import 'dart:convert';

import 'package:flutterapp/demo_carts/models/product.dart';
import 'package:flutterapp/demo_carts/models/responses/products.dart';

class ProductRepository {
  var jsonProducts = '''{
  "products": [
  {
  "name": "Iphone",
  "price": 200,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "iWatch",
  "price": 300,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/homepod/watch-product-lockup-callout.png"
  },
  {
  "name": "Canon",
  "price": 400,
  "image": "https://vn.canon/media/migration/shared/live/products/EN/eos6d-mkii-ef-24-70m-l.png"
  },
  {
  "name": "Tai nghe",
  "price": 150,
  "image": "https://www.jabra.sg/-/media/Images/Products/Jabra-Elite-75t/ComingSoon/e75_top_product.png?la=en-SG&hash=03737170FD979CD3D8080F2D9DAA76C8339B156C"
  },
  {
  "name": "Macbook Pro Retina 13 inch",
  "price": 150,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds",
  "price": 300,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "Iphone",
  "price": 200,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "iWatch",
  "price": 300,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/homepod/watch-product-lockup-callout.png"
  },
  {
  "name": "Canon",
  "price": 400,
  "image": "https://vn.canon/media/migration/shared/live/products/EN/eos6d-mkii-ef-24-70m-l.png"
  },
  {
  "name": "Tai nghe",
  "price": 150,
  "image": "https://www.jabra.sg/-/media/Images/Products/Jabra-Elite-75t/ComingSoon/e75_top_product.png?la=en-SG&hash=03737170FD979CD3D8080F2D9DAA76C8339B156C"
  },
  {
  "name": "Macbook Pro Retina 13 inch",
  "price": 150,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds",
  "price": 300,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "Iphone",
  "price": 200,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "iWatch",
  "price": 300,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/homepod/watch-product-lockup-callout.png"
  },
  {
  "name": "Canon",
  "price": 400,
  "image": "https://vn.canon/media/migration/shared/live/products/EN/eos6d-mkii-ef-24-70m-l.png"
  },
  {
  "name": "Tai nghe",
  "price": 150,
  "image": "https://www.jabra.sg/-/media/Images/Products/Jabra-Elite-75t/ComingSoon/e75_top_product.png?la=en-SG&hash=03737170FD979CD3D8080F2D9DAA76C8339B156C"
  },
  {
  "name": "Macbook Pro Retina 13 inch",
  "price": 150,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds",
  "price": 300,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  }
  ]
}''';

  void getProducts({Function(List<Product>) onSuccess}) {
    final decodedJson = json.decode(jsonProducts);
    var listProduct = Products.fromJson(decodedJson).products;
    onSuccess(listProduct);
  }
}
