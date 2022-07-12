import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/appdrawer.dart';
import 'package:shop/widgets/userproductitem.dart';


class UserProductScreen extends StatelessWidget {
  static const routeName = '/UserProductScreen';
  

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
             icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount:productsData. items.length,
        itemBuilder: (ctx,i)=>
        Column(
          children: [
            UserProductItem(
              title: productsData.items[i].title, 
              imageurl: productsData.items[i].imageUrl),
              Divider(),
          ],
        )
          ),
          
      
      
    );
  }
}