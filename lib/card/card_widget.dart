import 'package:add_to_cart/cart_provider/caart_provider.dart';
import 'package:add_to_cart/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final int index;
  final int productID;
  bool selected;
  bool showAddButton;

  CardWidget({
    Key? key,
    required this.title,
    required this.index,
    required this.productID,
    this.selected = false,
    this.showAddButton = true,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  addTOCart() {
    if (widget.selected == false) {
      Provider.of<CartProvider>(context, listen: false).addToCart(widget.title);
      showSnackBar("Product ${widget.title} is added", context);
    } else {
      Provider.of<CartProvider>(context, listen: false)
          .deleteFromCart(widget.title);
      showSnackBar("Product ${widget.title} is removed", context);
    }
    setState(() {
      widget.selected = !widget.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(3),
      elevation: 5,
      // color: Color.fromRGBO(widget.index * 5 + 30, widget.index * 7 + 30,
      //     widget.index * 9 + 50, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("This is Product ${widget.title}"),
            widget.showAddButton
                ? IconButton(
                    onPressed: addTOCart,
                    icon: widget.selected
                        ? Icon(
                            Icons.done,
                            color: Colors.red,
                          )
                        : Icon(Icons.add))
                : Container(),
          ],
        ),
      ),
    );
  }
}
