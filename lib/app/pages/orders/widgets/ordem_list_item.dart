import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../../../models/cart.dart';
import './../../../models/order_item.dart';

class OrderListItem extends StatefulWidget {
  final OrderItem orderItem;

  OrderListItem({this.orderItem});

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.orderItem.amount.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.orderItem.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon:
                  _expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
            ),
          ),
          if (_expanded) detailedOrderItems(widget.orderItem.cartItems)
        ],
      ),
    );
  }

  Container detailedOrderItems(List<CartItem> cartItems) => Container(
        height: min(cartItems.length * 20.0 + 50, 180),
        child: ListView.builder(
          itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  cartItems[index].title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${cartItems[index].quantity}x \$${cartItems[index].price}',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          itemCount: cartItems.length,
        ),
      );
}
