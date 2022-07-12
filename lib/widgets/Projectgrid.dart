import 'package:flutter/material.dart';
import 'Productitem.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProjectGrid extends StatelessWidget {

  final bool showFavs;

  ProjectGrid(this.showFavs);
  


  @override
  Widget build(BuildContext context) {
   final productsData= Provider.of<Products>(context);
   final products =showFavs?productsData.favs: productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ), 
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
       // create: (context) => products[i],
        child: ProductItem()
    )
      
      );
  }
}