import 'package:flutter/material.dart';
import 'package:flutter_shop_app/app/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
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
        backgroundColor: Colors.black45,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
