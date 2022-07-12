import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart' show Orders;
import '../widgets/order_item.dart';


class OrderScreen extends StatelessWidget {
 
 static const routeName = '/Order_screen';

  

  @override
  Widget build(BuildContext context) {
    final ordr = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),

      body: ListView.builder(
        itemCount: ordr.orders.length,
        itemBuilder: (ctx, i)=>OrderItem(ordr.orders[i])),
      
    );
  }
}