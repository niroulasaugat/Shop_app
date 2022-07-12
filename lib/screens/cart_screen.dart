import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/appdrawer.dart';
import 'package:shop/widgets/itemcart.dart';
import '../providers/cart.dart';
import '../providers/order.dart';
import '';


class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  static const routeName = 'Cart_detail';

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      drawer: AppDrawer(),

      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',style: TextStyle(fontSize: 20,),),

                  Spacer(),

                  Chip(label: Text('\$${cart.totalAmount}',
                   style: TextStyle(color: Colors.white),),
                    backgroundColor: Theme.of(context).primaryColor,
                    ),

                    FlatButton(onPressed: (){
                      Provider.of<Orders>(context, listen: false).
                      addOrder(cart.items.values.toList(), cart.totalAmount);

                      cart.clear();

                      
                    },
                     child: Text('ORDER NOW', style: TextStyle(color: Colors.purple),)),
                ],
              ),
            )
            
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder:(ctx, i) => ItemCart(
                ProdId: cart.items.keys.toList()[i],
                id: cart.items.values.toList()[i].id,
                 price: cart.items.values.toList()[i].price,
                  title: cart.items.values.toList()[i].title, 
                  quantity: cart.items.values.toList()[i].quantity)))
        ],
      ),
      
    );
  }
}