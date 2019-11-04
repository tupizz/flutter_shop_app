import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../models/product.dart';
import './../../pages/product-detail/product_detail_page.dart';
import './../../providers/products_provider.dart';
import './../../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailPage.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: Consumer<ProductsProvider>(
          builder: (ctx, provider, child) => GridTileBar(
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20,
                color: product.isFavorite
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
              onPressed: () {
                provider.toggleFavorite(product.id);
              },
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 20,
              ),
              onPressed: () {
                cartProvider.addItem(
                  product.id,
                  product.price,
                  product.title,
                  product.imageUrl,
                );
              },
            ),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.80),
            title: Text(
              '\$${product.price.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
