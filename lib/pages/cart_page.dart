import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/cart_product.dart';
import 'package:flutter_ecommerce/home.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return new  Scaffold(

        appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        //Retour vers la Page Home
        title: InkWell(
        onTap:() {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => new MyHomePage(title: "Kay Djeunde",)
          )
      );
    },
    child: Text("Panier"),
    ),

    //Actions du AppBar
    actions: <Widget>[
            new IconButton(icon: Icon(Icons.search,color: Colors.white),
             onPressed: (){}),


    ],
    ),
     body: new CartProducts(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("Total :"),
                subtitle: new Text("20000 CFA"),
              ),
            ),
            Expanded(
              child: new MaterialButton(onPressed: null,
               child: new Text("Commander",
               style: TextStyle(color: Colors.white),),
              color: Colors.red,),
            )
          ],
        ),
      ),
    );
  }
}
