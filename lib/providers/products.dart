

import 'package:flutter/cupertino.dart';
import 'package:shop/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Products with ChangeNotifier {

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

  ];

  //var _showFavoritesOnly = false;



  List<Product> get items {

    // if (_showFavoritesOnly) {
    //   return _items.where((e) => e.isFavourite).toList();
    // }

    return [..._items];
  }

  List<Product> get favs {
    return _items.where((e) => e.isFavourite).toList();
  }

  

  void addProduct(Product prod) {
    //const Url = Uri.https('https://console.firebase.google.com/u/0/project/shop-eccf7/database/shop-eccf7-default-rtdb/data/~2F', '/products.json');
    const url = 'https://console.firebase.google.com/u/0/project/shop-eccf7/database/shop-eccf7-default-rtdb/data/~2F';
    http.post(Uri.parse(url) ,body: json.encode({
      'title' : prod.title,
      'description': prod.description,
      'imageurl' : prod.imageUrl,
      'is favorite': prod.isFavourite,
      'price': prod.price,
    } ));
    final newprod = Product
    (id: DateTime.now().toString(),
     title: prod.title,
      price: prod.price,
       imageUrl: prod.imageUrl,
        description: prod.description);
        _items.add(newprod);
       // _items.insert(0, newprod)
    notifyListeners();
  }
//  void showfavoriteonly (){
//   _showFavoritesOnly = true;
//   notifyListeners();
//  }
//  void showAll() {
//   _showFavoritesOnly = false;
//   notifyListeners();
//  }

}