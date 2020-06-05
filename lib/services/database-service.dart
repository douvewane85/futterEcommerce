

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/models/user-model.dart';


class DataBaseService{

  //Collection de Reference

  final String uid;

  DataBaseService({this.uid});

  final CollectionReference ecomCollection=Firestore.instance.collection("ecom");

  Future updateUserData(String fullName,String adresse,  String login,String pwd ) async{

    return await ecomCollection.document(uid).setData({
      'id':uid,
      'fullName':fullName,
      'adresse':adresse,
      'login':login,
      'pwd':pwd,
      'avatar':"images/avatar.jpeg"

    });

  }

Future<User> getUserByLoginAndPassword( ) async{

   final QuerySnapshot query=await ecomCollection.where("id",isEqualTo: uid).getDocuments();

   return query.documents.map(
           (doc) => User(
               uid:doc["id"],
               id: doc["id"],
               fullName: doc["fullName"],
               login: doc["login"],
               pwd:doc["pwd"],
               adresse:doc["adresse"],
               avatar: doc['avatar']
       )
   ).toList().first;





  }

  Stream <QuerySnapshot> get users {
    return ecomCollection.snapshots();
  }

  


}
