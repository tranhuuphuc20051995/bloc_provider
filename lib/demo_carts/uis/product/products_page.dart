import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/blocs/cart_bloc.dart';
import 'package:flutterapp/demo_carts/blocs/product_bloc.dart';
import 'package:flutterapp/demo_carts/models/product.dart';
import 'package:flutterapp/demo_carts/widgets/coin_widget.dart';

import '../../../main.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage();

  static Widget newInstance() {
    return BlocProvider<ProductBloc>(
      creator: (_context, _bag) => ProductBloc(),
      child: ProductsPage(),
    );
  }

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with RouteAware {
  ProductBloc productBloc;
  CartBloc cartBloc;

  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Products',
          ),
          centerTitle: true,
          actions: <Widget>[
            CoinWidget(),
            CartWidget(),
          ],
        ),
        body: StreamBuilder<List<Product>>(
          stream: productBloc.productsStream,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data[index];
                  return GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            product.image,
                            width: 50,
                            height: 50,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  product.name,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "\$${product.price}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('${cartBloc.itemCount.value}');
                              cartBloc.addProductToCart(product);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 40,
                              child: Text(
                                'Add',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading...'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
    productBloc.getCount();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/cart");
      },
      child: Container(
        margin: EdgeInsets.all(3),
        width: 50,
        height: 50,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Icon(
                Icons.shopping_cart,
                size: 34,
              ),
            ),
            Positioned(
              top: 3,
              right: 3,
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: StreamBuilder<int>(
                  stream: cartBloc.itemCount,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData ? '${cartBloc.itemCount.value}' : '0',
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
