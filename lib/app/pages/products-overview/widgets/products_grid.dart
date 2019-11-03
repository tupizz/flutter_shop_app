import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../models/product.dart';
import './../../../providers/products_provider.dart';
import './../../../shared/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  bool showOnlyFavorites;

  ProductsGrid(this.showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    final List<Product> products = showOnlyFavorites
        ? productsProvider.favoriteItems
        : productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(
        product: products[index],
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
