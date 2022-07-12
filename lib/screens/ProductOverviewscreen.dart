import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/Productitem.dart';
import 'package:shop/widgets/appdrawer.dart';
import 'package:shop/widgets/badge.dart';
import '../providers/product.dart';
import '../widgets/Projectgrid.dart';
import '../providers/cart.dart';

enum filterOptions {
  favourites,
  All
}

class ProductOverviewScreen extends StatefulWidget {


  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ShopApp'),
        actions: [
          PopupMenuButton(
            onSelected: (filterOptions selectedValue){

              setState(() {

                if (selectedValue == filterOptions.favourites) {
                _showOnlyFavorites = true;
              } else 
              {
                 _showOnlyFavorites = false;
              } 
              });

              

            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=> [
              PopupMenuItem(child: Text('Only Favourites'), value: filterOptions.favourites),
              PopupMenuItem(child: Text('Show All'), value: filterOptions.All,)
            ]),
            Consumer<Cart> (builder: (context, value, ch) => 
             Badge(
              
            value: value.itemCount.toString(),
             color: Colors.red,
             child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
             }
             )
            
            )
          
            )
        ]
      ),
      drawer: AppDrawer(),
      body: ProjectGrid(_showOnlyFavorites)
      
    );
  }
}

