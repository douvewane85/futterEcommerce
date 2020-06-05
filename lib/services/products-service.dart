


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/models/categorie-model.dart';
import 'package:flutter_ecommerce/models/product-model.dart';


class ProductService{

  //Collection de Reference



  final CollectionReference productsCollection=Firestore.instance.collection("products");


  Future<List<Product>> products() async{
    QuerySnapshot qShot =await  productsCollection.getDocuments();
    return qShot.documents.map(
            (doc) => Product(
               product_name: doc['name'],
              product_picture: doc['picture'],
              product_price: doc['price'],
              product_old_price: doc['old_price'],
            )
    ).toList();
  }



}