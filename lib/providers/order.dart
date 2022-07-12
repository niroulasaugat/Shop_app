import 'package:flutter/foundation.dart';
import 'package:shop/providers/cart.dart';
import '../widgets/itemcart.dart';

class OrderItem {
  final String id;
  final double price;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({ 
    required this.id,
    required this.price,
    required this.products,
    required this.dateTime

  });

}

class Orders with ChangeNotifier {

  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];

  }

  void addOrder(List<CartItem> cartproducts, double total) {
    _orders.insert(0, OrderItem(
      id: DateTime.now().toString(),
      price: total,
      dateTime: DateTime.now(),
      products: cartproducts
    ));
    notifyListeners();
  }

}