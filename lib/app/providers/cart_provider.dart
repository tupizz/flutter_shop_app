import 'package:flutter/widgets.dart';
import 'package:flutter_shop_app/app/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCardItem) => CartItem(
                id: existingCardItem.id,
                title: existingCardItem.title,
                price: existingCardItem.price,
                quantity: existingCardItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
