import 'package:flutter/material.dart';
import '../providers/order.dart' as ord;
import 'package:intl/intl.dart';


class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.price}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(onPressed: (){},
             icon: Icon(Icons.expand_more)),
          )
        ],
      ),
      
    );
  }
}