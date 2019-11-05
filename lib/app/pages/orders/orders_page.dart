import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/ordem_list_item.dart';
import './../../providers/orders_provider.dart';
import './../../shared/widgets/app_drawer.dart';

class OrdersPage extends StatelessWidget {
  static String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderListItem(
          orderItem: ordersProvider.orders[index],
        ),
        itemCount: ordersProvider.orders.length,
      ),
    );
  }
}
