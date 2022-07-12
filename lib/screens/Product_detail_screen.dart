import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
class ProductDetailScreen extends StatelessWidget {

  static const routeName = 'Product_detail';

  // ignore: non_constant_identifier_names
  



  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context, listen: false).items
    .firstWhere((e)=> e.id == ProductId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
      
            Text('\$${loadedProduct.price}', textAlign: TextAlign.center, 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: Text(loadedProduct.description, style: TextStyle(fontSize: 20, color: Colors.black,),
              textAlign: TextAlign.center,
              softWrap: true,),
            )
          ],
        ),
      ),
    );
  }
}