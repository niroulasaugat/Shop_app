import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ItemCart extends StatelessWidget {
  final String id;
  final String ProdId;
  final double price;
  final String title;
  final int quantity;

  ItemCart({
    required this.id,
    required this.ProdId,
    required this.price,
    required this.title,
    required this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeItem(ProdId);

      },
      confirmDismiss: (direction){
       return showDialog(context: context, builder: (ctx)=> AlertDialog(
          title: Text('Are you Sure??'),
          content: Text('Do you want to remove this item from the Cart??'),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.of(ctx).pop(true);
              },
               child: Text('Yes'),
               ),
               FlatButton(
              onPressed: (){
                Navigator.of(ctx).pop(false);
              },
               child: Text('No'),
               )
          ],
        )
        
        );

      },
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white, size: 40,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            
            ),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('Total: \$${price * quantity}', style: TextStyle(color: Colors.grey),),
            trailing: Text('\$${quantity}x', style: TextStyle(color: Colors.purple),),
          ),
        ),
        
      ),
    );
  }
}