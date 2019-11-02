import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static String routeName = '/products/details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$productId'),
      ),
      body: Container(),
    );
  }
}
