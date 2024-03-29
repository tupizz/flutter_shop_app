import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/pages/cart/cart_page.dart';
import './app/providers/cart_provider.dart';
import './app/pages/orders/orders_page.dart';
import './app/shared/utils/color_utils.dart';
import './app/providers/orders_provider.dart';
import './app/providers/products_provider.dart';
import './app/pages/product-detail/product_detail_page.dart';
import './app/pages/products-overview/products_overview_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrdersProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorUtils.hexToColor('#3d0e1e'),
          accentColor: ColorUtils.hexToColor('#f88020'),
          canvasColor: ColorUtils.hexToColor('#fff4e4'),
          fontFamily: 'Lato',
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductsOverviewPage(),
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
          CartPage.routeName: (ctx) => CartPage(),
          OrdersPage.routeName: (ctx) => OrdersPage(),
        },
      ),
    );
  }
}
