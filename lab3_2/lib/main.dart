import 'package:flutter/material.dart';
import 'package:lab3_2/cart.dart';
import 'package:lab3_2/product.dart';
import 'package:lab3_2/form.dart';
import 'package:provider/provider.dart';
import 'package:lab3_2/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
        create: (context) => CartModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Catalog(),
        ));
  }
}

class Catalog extends StatefulWidget {
  Catalog({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Product> _products = List<Product>();

  @override
  void initState() {
    super.initState();
    _populateProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (Provider.of<CartModel>(context, listen: false).cartsLen > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Consumer<CartModel>(
                          builder: (context, cart, child) {
                            return Text(cart.cartsLen.toString());
                          },
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (Provider.of<CartModel>(context, listen: false).cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildListView(),
    );
  }


  ListView _buildListView() {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        var item = _products[index];
        return FormProduct(item, Provider.of<CartModel>(context, listen: false).addProduct, 'Buy');
      },
    );
  }

  void _populateProducts() {
    var list = <Product>[
      Product(
        name: 'Product1',
      ),
      Product(
        name: 'Product2',
      ),
      Product(
        name: 'Product3',
      ),
      Product(
        name: 'Product4',
      ),
      Product(
        name: 'Product5',
      ),
      Product(
        name: 'Product6',
      ),
    ];

    setState(() {
      _products = list;
    });
  }
}


