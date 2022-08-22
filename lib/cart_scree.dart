import 'package:add_to_cart/card/card_widget.dart';
import 'package:add_to_cart/cart_provider/caart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> title = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    title = Provider.of<CartProvider>(context, listen: false).getCart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Your's Products",
              style: TextStyle(fontSize: 25),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      title: title[index],
                      index: index,
                      productID: index,
                      showAddButton: false,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
