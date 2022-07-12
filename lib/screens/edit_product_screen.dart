import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/Edit_product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _priceFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: '', title: '', price: 0, imageUrl: '', description: '');

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _saveForm() {

   final isvalid = _form.currentState()!.validate();
   if(!isvalid){
    return;
   }
    _form.currentState()!.save();

    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
   

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter a title';
                  }
                   return null;
                },
                onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id,
                     title: value.toString(),
                     price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl, 
                      description: _editedProduct.description);
                },


              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id, 
                    title: _editedProduct.title,
                     price: double.parse(value.toString()),
                      imageUrl: _editedProduct.imageUrl, 
                      description: _editedProduct.description);
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter a price.';

                  }
                  if(double.tryParse(value)==null){
                    return 'Please enter a valid Price';

                  }
                  if(double.parse(value) <= 0){
                    return 'Please enter right price';
                  }
                  return null;
                },
              ), 
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter a description';
                    
                  }
                  if(value.length < 10){
                    return 'Length should be greater than 10';
                  }
                   return null;
                },
                onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id, 
                    title: _editedProduct.title,
                     price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl, 
                      description: value.toString());

                },
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 12, right: 8),
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty? Text('Enter an Image'): 
                    FittedBox(
                      child: Image.network(_imageUrlController.text),
                      fit: BoxFit.cover,
                    )
              
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter an Image';
                        }
                        if(!value.startsWith('http') || !value.startsWith('https')){
                          return 'Please enter an valid url';
                        }
                        return null;

                        
                      },
                      onFieldSubmitted: (_){
                        _saveForm();
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),),
      
    );
  }
}