import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class Product with ChangeNotifier {

  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
     this.isFavourite = false,

  });

  void toggleFavourite() {

    isFavourite = !isFavourite;
    notifyListeners();
  }

}