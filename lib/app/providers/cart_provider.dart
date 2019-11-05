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

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.quantity * cartItem.price;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String imgUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCardItem) => CartItem(
                id: existingCardItem.id,
                productId: productId,
                title: existingCardItem.title,
                price: existingCardItem.price,
                quantity: existingCardItem.quantity + 1,
                imgUrl: existingCardItem.imgUrl,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                productId: productId,
                title: title,
                price: price,
                quantity: 1,
                imgUrl: imgUrl,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
