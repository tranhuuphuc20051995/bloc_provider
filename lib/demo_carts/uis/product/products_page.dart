import 'package:flutter/material.dart';

import '../../../main.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

List<String> list = [
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  "Eight",
  "Nine",
  "Ten"
];

class _ProductsPageState extends State<ProductsPage> with RouteAware {
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
            GestureDetector(
              onTap: (){

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
                        child: Text(
                          '1000',
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              color: Colors.deepPurple,
              child: Text(list[index]),
            );
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
