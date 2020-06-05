


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/models/categorie-model.dart';


class CategorieService{

  //Collection de Reference



  final CollectionReference CategoriesCollection=Firestore.instance.collection("categories");


  Future<List<Category>> categories() async{
    QuerySnapshot qShot =await CategoriesCollection.getDocuments();
    return qShot.documents.map(
            (doc) => Category(
              image_caption: doc['image_caption'],
              image_location: doc['image_location']
            )
    ).toList();
  }



}