import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var panier=[
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "qte" : 1,
      "size":"M",
      "color":"red",
      "price": 20000

    },
    {
      "name":"Robe Rouge",
      "picture":"images/products/dress1.jpeg",
      "qte" : 1,
      "size":"M",
      "color":"red",
      "price": 25000

    },
    {
      "name":"Jupe",
      "picture":"images/products/skt1.jpeg",
      "qte" : 1,
      "size":"M",
      "color":"red",
      "price": 25000

    },
    {
      "name":"Talons Hautes",
      "picture":"images/products/hills1.jpeg",
      "qte" : 1,
      "size":"M",
      "color":"red",
      "price": 25000

    },
    {
      "name":"Jupes",
      "picture":"images/products/skt2.jpeg",
      "qte" : 1,
      "size":"M",
      "color":"red",
      "price": 25000

    },
    {
      "name":"Chaussures",
      "picture":"images/products/shoe1.jpg",
      "qte" : 1,
      "size":"32",
      "color":"black",
      "price": 25000

    }
    ,
    {
      "name":"Pantalons",
      "picture":"images/products/pants1.jpg",
      "qte" : 1,
      "size":"M",
      "color":"red",
      "price": 25000

    }




  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: panier.length,
        itemBuilder: (context,index){
             return new SigleCartProduct(
                 product_cart_name: panier[index]["name"],
                 product_cart_picture:panier[index]["picture"],
                 product_cart_size:panier[index]["size"],
                 product_cart_price:panier[index]["price"],
                 product_cart_qte:panier[index]["qte"],
                 product_cart_color:panier[index]["color"]

             );

        }
    );
  }
}

class SigleCartProduct extends StatelessWidget {

  final String product_cart_name;
  final String product_cart_picture;
  final String product_cart_size;
  final int  product_cart_price;
  final int  product_cart_qte;
  final String  product_cart_color;
  SigleCartProduct({
    this.product_cart_name,
    this.product_cart_picture,
    this.product_cart_size,
    this.product_cart_price,
    this.product_cart_qte,
    this.product_cart_color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          product_cart_picture,
           width: 60.0,height: 60.0,
        ),
        title: new Text(product_cart_name),
        subtitle: Column(
          children: <Widget>[
            new Row(
                 children: <Widget>[

                    Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Size : "),
                     ),

                   Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Text(product_cart_size,style: TextStyle(
                       color: Colors.red,

                     ),),
                   ),


                   Padding(
                     padding: const EdgeInsets.fromLTRB(100.0,0.0,0.0,0.0),
                     child: Text("Couleur: "),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Text(product_cart_color,style: TextStyle(
                         color: Colors.red
                     )),
                   ),



                 ],
            ),

            new Row(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Price : "),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("${product_cart_price} CFA",style: TextStyle(
                      color: Colors.red,fontSize: 14.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,0.0,0.0,0.0),
                  child: Text("Qte: "),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("${product_cart_qte}",style: TextStyle(
                      color: Colors.red
                  )),
                ),



              ],
            )

          ],
        ),

      ),
    );
  }
}

