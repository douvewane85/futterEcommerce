import 'package:flutter/material.dart';



//Mes Packadges

import 'package:flutter_ecommerce/pages/home/home.dart';
import 'package:flutter_ecommerce/components/product/gridView_products.dart';

class PageDetailsProduct extends StatefulWidget {
  final String product_details_name;
  final String product_details_picture;
  final int product_old_details_price;
  final int  product_details_price;

  PageDetailsProduct({
    this.product_details_name,
    this.product_details_picture,
    this.product_old_details_price,
    this.product_details_price,
});
  @override
  _PageDetailsProductState createState() => _PageDetailsProductState();
}

class _PageDetailsProductState extends State<PageDetailsProduct> {
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
          child: Text("Details Produits"),
        ),
        //Actions du AppBar
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white),
              onPressed: (){}),


        ],
      ),
      body: new ListView(
        children: <Widget>[
          //=======Images Products and Infos Details============
          Container(
            height: 300.0,
           child: GridTile(
             //=======Images Products ============
               child: Container(
                 color: Colors.white,
                 child: Image.asset(
                  widget.product_details_picture,
                   fit: BoxFit.cover,),
               ),
             //=======and Infos Details=============
             footer: new Container(
               color: Colors.white70,
               child: ListTile(
                 leading: new Text(
                   widget.product_details_name,
                   style: TextStyle(
                     fontWeight: FontWeight.bold
                   ),
                 ),
                 title: new Row(
                   children: <Widget>[
                     Expanded(
                       child: new  Text(
                           "${widget.product_details_price} CFA",
                           style: TextStyle(
                               color: Colors.red,
                               fontWeight: FontWeight.bold,
                               fontSize: 12.0
                           )

                       ),
                     ),
                     Expanded(
                       child: new  Text(
                           "${widget.product_old_details_price} CFA",
                           style: TextStyle(
                               color: Colors.grey,
                               fontWeight: FontWeight.bold,
                               decoration: TextDecoration.lineThrough,
                               fontSize: 12.0
                           ),


                       ),
                     ),

                   ],
                 ),

               ),
             ),

           ),
          ),
          //==========Les Buttons==================
          Row(
            children: <Widget>[

              Expanded(
                //=========Button Couleur===================
                child: MaterialButton(
                  onPressed: (){

                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Couleur")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),

                    ],
                  ),
                ),
              ),
              Expanded(
                //=========Button Taille===================
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Taille"),
                        content: new Text("Choisir une Taille"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                          },
                          child: new Text("Fermer"),),

                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Taille")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),

                    ],
                  ),
                ),
              ),
              Expanded(
                //=========Button Qte===================
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qte")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),

                    ],
                  ),
                ),
              )
            ],
          ),
          //==========Dexieme Ligne de  Buttons==================
          Row(
            children: <Widget>[
              Expanded(
                //=========Button Acheter===================
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Acheter Maintenant",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  ),
                ),
                 new IconButton(icon:Icon(Icons.add_shopping_cart,color: Colors.red,), onPressed: null),
                 new IconButton(icon:Icon(Icons.favorite_border,color:Colors.red), onPressed: null),
            ],
          ),
          Divider(),
          //Description du Produit
          ListTile(
            title: new Text("Description du Poduit",
                style:TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                )),
            subtitle: new Text(
                    "lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            ),

          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Libelle du Produit",
                style: TextStyle(
                  color: Colors.grey
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product_details_name),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Libelle du Produit",
                  style: TextStyle(
                      color: Colors.grey
                  ),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(""),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Assurance Produit",
                  style: TextStyle(
                      color: Colors.grey
                  ),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(""),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Produits Similaires",style:TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold
            )),
          ),
          //Produits Simmilair
          Container(
            height: 360,
            child: SimilarPoducts(),
          )



        ],
      ),
    );
  }
}

class SimilarPoducts extends StatefulWidget {
  @override
  _SimilarPoductsState createState() => _SimilarPoductsState();
}

class _SimilarPoductsState extends State<SimilarPoducts> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 25000,
      "price": 20000
    },
    {
      "name": "Robe Rouge",
      "picture": "images/products/dress1.jpeg",
      "old_price": 35000,
      "price": 25000
    },

    {
      "name": "Talons Hautes",
      "picture": "images/products/hills1.jpeg",
      "old_price": 35000,
      "price": 25000
    },

    {
      "name": "Chaussures",
      "picture": "images/products/shoe1.jpg",
      "old_price": 35000,
      "price": 25000
    }



  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        }
    );
  }
}


