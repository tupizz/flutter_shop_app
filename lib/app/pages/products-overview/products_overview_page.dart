import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/badge.dart';
import './widgets/products_grid.dart';
import './../../pages/cart/cart_page.dart';
import './../../providers/cart_provider.dart';

enum FilterOptions { FAVORITES, ALL }

class ProductsOverviewPage extends StatefulWidget {
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              switch (selectedValue) {
                case FilterOptions.FAVORITES:
                  setState(() {
                    _showOnlyFavorite = true;
                  });
                  break;
                case FilterOptions.ALL:
                  setState(() {
                    _showOnlyFavorite = false;
                  });
                  break;
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.FAVORITES,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.ALL,
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (ctx, provider, ch) => Badge(
              value: provider.itemCount.toString(),
              childWidget: ch,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: new ProductsGrid(_showOnlyFavorite),
    );
  }
}
