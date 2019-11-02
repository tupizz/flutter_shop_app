import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../providers/products_provider.dart';
import './../../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  static String routeName = '/products/details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final Product product =
        Provider.of<ProductsProvider>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Container(),
    );
  }
}
