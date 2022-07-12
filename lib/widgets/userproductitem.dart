import 'package:flutter/material.dart';


class UserProductItem extends StatelessWidget {
  final String title;
  final String imageurl;

  UserProductItem({
    required this.title,
    required this.imageurl
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageurl),),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){},
            icon: Icon(Icons.edit, color: Colors.purple,)),
      
            IconButton(
              onPressed: (){},
               icon: Icon(Icons.delete, color: Colors.red,))
            
           
          ],
          
        ),
      ),
      
    );
  }
}