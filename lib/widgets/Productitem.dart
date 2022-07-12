import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/Product_detail_screen.dart';
import '../screens/ProductOverviewscreen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
   final prod = Provider.of<Product>(context, listen: false);
   final cart = Provider.of<Cart>(context, listen: false);

    return 
       ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: prod.id);
          },
          child: GridTile(
            child: Image.network(prod.imageUrl, fit: BoxFit.cover,),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: 
                
                IconButton(
                color: Theme.of(context).accentColor,
                onPressed: (){
                  prod.toggleFavourite();
                },
                 icon: Icon(prod.isFavourite? Icons.favorite : Icons.favorite_outline)),
              
              title: Text(prod.title, style: TextStyle(color: Colors.white, fontSize: 15),),
            
              
              trailing:IconButton(
                color: Theme.of(context).accentColor,
                onPressed: (){
                  cart.additem(prod.id , prod.price, prod.title);
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("An item has been added to the Cart"),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(label: 'UNDO',onPressed:(){
                        cart.removeSingleItem(prod.id);
                      } ,) ,
                      
                      )
                  );

                },
                 icon: Icon(Icons.shopping_cart)),
            
            
            ),
            
          ),
        ),
      
    );
  }
}