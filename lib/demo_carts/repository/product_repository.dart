import 'dart:convert';

import 'package:flutterapp/demo_carts/models/product.dart';
import 'package:flutterapp/demo_carts/models/responses/products.dart';

class ProductRepository {
  var jsonProducts = '''{
  "products": [
  {
  "name": "Iphone 1",
  "price": 10,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "iWatch 1",
  "price": 15,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/homepod/watch-product-lockup-callout.png"
  },
  {
  "name": "Canon 1",
  "price": 20,
  "image": "https://vn.canon/media/migration/shared/live/products/EN/eos6d-mkii-ef-24-70m-l.png"
  },
  {
  "name": "Tai nghe 1",
  "price": 25,
  "image": "https://www.jabra.sg/-/media/Images/Products/Jabra-Elite-75t/ComingSoon/e75_top_product.png?la=en-SG&hash=03737170FD979CD3D8080F2D9DAA76C8339B156C"
  },
  {
  "name": "Macbook Pro Retina 13 inch 1",
  "price": 30,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds 1",
  "price": 35,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "Iphone 2",
  "price": 40,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "iWatch 2",
  "price": 45,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/homepod/watch-product-lockup-callout.png"
  },
  {
  "name": "Canon 2",
  "price": 50,
  "image": "https://vn.canon/media/migration/shared/live/products/EN/eos6d-mkii-ef-24-70m-l.png"
  },
  {
  "name": "Tai nghe 2",
  "price": 55,
  "image": "https://www.jabra.sg/-/media/Images/Products/Jabra-Elite-75t/ComingSoon/e75_top_product.png?la=en-SG&hash=03737170FD979CD3D8080F2D9DAA76C8339B156C"
  },
  {
  "name": "Macbook Pro Retina 13 inch 2",
  "price": 60,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds 2",
  "price": 65,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "Iphone 3",
  "price": 70,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "iWatch 3",
  "price": 75,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/homepod/watch-product-lockup-callout.png"
  },
  {
  "name": "Canon 3",
  "price": 80,
  "image": "https://vn.canon/media/migration/shared/live/products/EN/eos6d-mkii-ef-24-70m-l.png"
  },
  {
  "name": "Tai nghe 3",
  "price": 85,
  "image": "https://www.jabra.sg/-/media/Images/Products/Jabra-Elite-75t/ComingSoon/e75_top_product.png?la=en-SG&hash=03737170FD979CD3D8080F2D9DAA76C8339B156C"
  },
  {
  "name": "Macbook Pro Retina 13 inch 3",
  "price": 90,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds 3",
  "price": 95,
  "image": "https://cdn.dienthoaigiakho.vn/x/https://cdn.dienthoaigiakho.vn/photos/1568181384559-iphone11-red-select-2019.png"
  },
  {
  "name": "Macbook Pro Retina 13 inch 4",
  "price": 100,
  "image": "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/il/macbook-product-lockup-nav.png"
  },
  {
  "name": "Ground almonds 4",
  "price": 105,
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
