import 'package:flutter/foundation.dart';

import './../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Tênis nike',
      description: 'Prepare any meal you want.',
      price: 9.99,
      imageUrl:
          'https://imgcentauro-a.akamaihd.net/900x900/91501831/tenis-nike-revolution-4-masculino-img.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Oculos Lema2',
      description: 'Lindo óculos para estudos',
      price: 49.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTnQ7pBcrarFPuz0N6TvhZhTbqE_CJifM0vlJd1IP0DIHmuMUot',
    ),
    Product(
      id: 'p7',
      title: 'Macbook air',
      description: 'Um lindo e potente computador.',
      price: 599.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXoY4GTvWY9yDB23PHsY4eoOfy7NrU6A3_V5BllW4BBjjLeSxp',
    ),
    Product(
      id: 'p8',
      title: 'Tênis Nike',
      description: 'Corridas, academia, dia a dia.',
      price: 89.99,
      imageUrl:
          'https://imgcentauro-a.akamaihd.net/900x900/9150186R/tenis-nike-revolution-4-masculino-img.jpg',
    ),
  ];

  // retorno uma cópia dos elementos, não o ponteiro do vetor
  List<Product> get items {
    var items = [..._items];
    var favoritedItems = items.where((item) => item.isFavorite);
    var notFavoritedItems = items.where((item) => !item.isFavorite);

    return [...favoritedItems, ...notFavoritedItems];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) => _items.firstWhere((item) => item.id == id);

  void toggleFavorite(String id) {
    var product = _items.firstWhere((item) => item.id == id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  void addProduct(Product item) {
    // _items.add(item);
    notifyListeners();
  }
}
