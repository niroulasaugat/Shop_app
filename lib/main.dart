import 'package:flutter/material.dart';
import 'package:shop/screens/OrderScreen.dart';

import 'package:shop/screens/ProductOverviewscreen.dart';
import 'package:shop/screens/Product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'providers/products.dart';
import 'providers/cart.dart';
import 'providers/order.dart';
import './screens/user_product_screen.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(
      create: (ctx)=> Products(),),

      ChangeNotifierProvider(create: (ctx)=> Cart(),
      ),

      ChangeNotifierProvider(create: (ctx)=> Orders())

    ],
     
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange
        ),
        home: ProductOverviewScreen(),
    
        routes: {
          ProductDetailScreen.routeName : (ctx)=> ProductDetailScreen(),
          CartScreen.routeName: (ctx)=>CartScreen(),
          OrderScreen.routeName: (ctx)=> OrderScreen(),
          UserProductScreen.routeName:(ctx)=>UserProductScreen(),
          EditProductScreen.routeName:(ctx)=>EditProductScreen()
        },
    
        
      ) 
      );
    
  }
}