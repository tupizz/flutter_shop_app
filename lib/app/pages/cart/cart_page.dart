import 'package:flutter/material.dart';
import 'package:flutter_shop_app/app/pages/cart/widgets/cart_item.dart';
import 'package:provider/provider.dart';

import './../../providers/cart_provider.dart';
import './../../providers/orders_provider.dart';

class CartPage extends StatelessWidget {
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (ctx, provider, child) => Column(
          children: <Widget>[
            _buildTotalValueCard(provider, context),
            SizedBox(height: 10),
            _buildListViewItemsFromCart(provider),
          ],
        ),
      ),
    );
  }

  Expanded _buildListViewItemsFromCart(CartProvider provider) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) => CartItemTile(
          cartItem: provider.items.values.toList()[index],
        ),
        itemCount: provider.itemCount,
      ),
    );
  }

  Card _buildTotalValueCard(CartProvider provider, BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // Esse widget vai jogar todos os itens subsequentes da row para direita
            Spacer(),
            Chip(
              label: Text(
                '\$${provider.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryTextTheme.title.color,
                ),
              ),
              backgroundColor: Theme.of(context).accentColor,
            ),
            Consumer<CartProvider>(
              builder: (ctx, cartProvider, child) => FlatButton(
                child: Text('Order now'),
                onPressed: () {
                  var orderProvider = Provider.of<OrdersProvider>(
                    context,
                    listen: false,
                  );

                  orderProvider.addOrder(
                    cartProvider.items.values.toList(),
                    cartProvider.totalAmount,
                  );

                  cartProvider.clearCart();
                },
                textColor: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
