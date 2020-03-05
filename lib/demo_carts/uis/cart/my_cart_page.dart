import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_carts/blocs/cart_bloc.dart';
import 'package:flutterapp/demo_carts/models/product.dart';

import '../../../main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with RouteAware {
  CartBloc cartBloc;

  @override
  void initState() {
    cartBloc = BlocProvider.of(context);
    super.initState();
  }

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
        body: StreamBuilder<List<Product>>(
          stream: cartBloc.cartStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://images.thefepi.com/file/empty-cart.png",
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.black,
                  );
                },
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          product.image,
                          width: 100,
                          height: 100,
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
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
