import 'package:flutter/material.dart';
import 'package:shop/screens/OrderScreen.dart';
import '../screens/ProductOverviewscreen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Itinaries'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            }
            
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
            
          ),
          Divider(),
          
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Orders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
          Divider()
        ]
      ),

      
    );
  }
}