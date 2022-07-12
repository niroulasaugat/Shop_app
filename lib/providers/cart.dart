import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/productitem.dart';
import 'products.dart';


class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price
  });
}



class Cart with ChangeNotifier {

  late Map<String,CartItem>_items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return  _items.length;
  } 

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) { 
      total += CartItem.quantity * CartItem.price;
    });
    return total;
  }

  void additem(String prodid, double price, String title){

    if(_items.containsKey(prodid)){
      _items.update(prodid, (value) => CartItem(id: value.id,
       price: value.price, 
       title: value.title,
       quantity: value.quantity + 1));

    }
    else {
      _items.putIfAbsent(prodid, () => 
    CartItem(
        id:DateTime.now().toString() ,
       title: title,
        quantity: 1,
         price: price)
         );
    }
    notifyListeners();    
  }

  void removeItem(String prodid) {
    _items.remove(prodid);
    notifyListeners();

  }

  void clear (){
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String prodid) {
    if(!_items.containsKey(prodid)){
      return;
    }

    if (items[prodid]!.quantity> 1){
      _items.update(prodid, (value) => CartItem(
        id: value.id,
         title: value.title,
          quantity: value.quantity-1,
           price: value.price));



    }
    else {
      _items.remove(prodid);
    }
    notifyListeners();

  }


}