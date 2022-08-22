import 'package:add_to_cart/card/card_widget.dart';
import 'package:add_to_cart/cart_provider/caart_provider.dart';
import 'package:add_to_cart/cart_scree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> title = [];
  bool selected = false;
  getData() {
    title = Provider.of<CartProvider>(context).getCart;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    print(title);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.card_travel))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              if (title.contains(index.toString())) {
                selected = true;
              } else {
                selected = false;
              }
              return CardWidget(
                title: index.toString(),
                index: index,
                productID: index,
                selected: selected,
              );
            }),
      ),
    );
  }
}
