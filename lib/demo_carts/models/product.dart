class Product {
  String _name;
  int _price;
  String _image;

  Product({String name, int price, String image}) {
    this._name = name;
    this._price = price;
    this._image = image;
  }

  String get name => _name;
  set name(String name) => _name = name;
  int get price => _price;
  set price(int price) => _price = price;
  String get image => _image;
  set image(String image) => _image = image;

  Product.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _price = json['price'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['price'] = this._price;
    data['image'] = this._image;
    return data;
  }
}