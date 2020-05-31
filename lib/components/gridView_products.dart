import 'package:flutter/material.dart';

//Mes Importation
import 'package:flutter_ecommerce/pages/product_details.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  /*

   */
  var product_list=[
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
       "old_price" : 25000,
      "price": 20000

    },
    {
      "name":"Robe Rouge",
      "picture":"images/products/dress1.jpeg",
      "old_price" : 35000,
      "price": 25000

    },
{
      "name":"Jupe",
      "picture":"images/products/skt1.jpeg",
      "old_price" : 35000,
      "price": 25000

    },
    {
      "name":"Talons Hautes",
      "picture":"images/products/hills1.jpeg",
      "old_price" : 35000,
      "price": 25000

    },
    {
      "name":"Jupes",
      "picture":"images/products/skt2.jpeg",
      "old_price" : 35000,
      "price": 25000

    },
    {
      "name":"Chaussures",
      "picture":"images/products/shoe1.jpg",
      "old_price" : 35000,
      "price": 25000

    }
    ,
    {
      "name":"Pantalons",
      "picture":"images/products/pants1.jpg",
      "old_price" : 35000,
      "price": 25000

    },
    {
      "name":"Pantalons",
      "picture":"images/products/pants2.jpeg",
      "old_price" : 35000,
      "price": 25000

    }




  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount:product_list.length ,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return SingleProduct(
            product_name:product_list[index]['name'],
            product_picture:product_list[index]['picture'],
            product_old_price:product_list[index]['old_price'],
            product_price:product_list[index]['price'],
          );
        }
    );
  }

}

class SingleProduct extends StatelessWidget {
  final String product_name;
  final String product_picture;
  final int product_old_price;
  final int  product_price;

  SingleProduct({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Hero(tag: Text("hero 1"),
          child: Material(
            child: InkWell(
              //Gestion des Routes
              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                //Passage du produit
                  builder: (context)=>new PageDetailsProduct(
                      product_details_name:product_name ,
                      product_details_picture: product_picture,
                      product_details_price: product_price,
                      product_old_details_price: product_old_price,

                  ))),
              child: GridTile(
                   footer: Container(
                    color: Colors.white,
                     /* changement du ListTilte en Row*/
                     child: new Row(
                       children: <Widget>[
                         Expanded(
                           child: Text(product_name,
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 fontSize: 16.0
                               )),
                         ),
                         new Text("$product_price CFA",style: TextStyle(
                             color: Colors.red,
                             fontWeight: FontWeight.bold,
                             fontSize: 12.0
                         ),
                         ),
                       ],
                     )
                   ),
                  child: Image.asset(
                    product_picture,
                  fit: BoxFit.cover,)
              ),
            ),
          )) ,
    );
  }
}

