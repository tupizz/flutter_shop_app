import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../models/cart.dart';
import './../../../providers/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  CartItemTile({this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cartItem.imgUrl),
            ),
            title: Text('${cartItem.title}'),
            subtitle: Text('Quantidade: ${cartItem.quantity}'),
            trailing: Chip(
              label: Text('\$${cartItem.quantity * cartItem.price}'),
            ),
          ),
        ),
      ),
    );
  }
}
