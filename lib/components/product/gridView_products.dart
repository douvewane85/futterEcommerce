import 'package:flutter/material.dart';

//Mes Importation
import 'package:flutter_ecommerce/pages/product/product_details.dart';
import 'package:flutter_ecommerce/services/products-service.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  /*

   */
  ProductService service=new ProductService();
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

  Widget createProductsListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    return GridView.builder(
        itemCount:values == null ? 0 : values.length ,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return SingleProduct(
            product_name:values[index].product_name,
            product_picture:values[index].product_picture,
            product_old_price:values[index].product_old_price,
            product_price:values[index].product_price,
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      child: FutureBuilder(
          future: service.products(),
          initialData: [

          ],
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return createProductsListView(context, snapshot);

            }
            return CircularProgressIndicator();

          }
      ),
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

