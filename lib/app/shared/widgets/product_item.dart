import 'package:flutter/material.dart';

import './../../models/product.dart';
import './../../pages/product-detail/product_detail_page.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
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
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              size: 15,
            ),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 15,
            ),
            onPressed: () {},
          ),
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.80),
          title: Text(
            '\$${product.price.toString()}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
