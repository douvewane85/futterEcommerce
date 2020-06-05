import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//Mes Packadges
import 'package:flutter_ecommerce/components/product/listeView_categories.dart';

import 'package:flutter_ecommerce/components/product/gridView_products.dart';
import 'package:flutter_ecommerce/components/home/menuItem-widget.dart';
import 'package:flutter_ecommerce/pages/panier/cart_page.dart';

import 'package:flutter_ecommerce/pages/auth/login_page.dart';
import 'package:flutter_ecommerce/services/auth-service.dart';
import 'package:flutter_ecommerce/services/categorie-service.dart';
import 'package:flutter_ecommerce/services/database-service.dart';
import 'package:flutter_ecommerce/shared/carossel-sh-widget.dart';

import '../../models/categorie-model.dart';
import '../../components/home/menu-drawer.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  //#################Carousel#####################################
  @override
  Widget build(BuildContext context) {







    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(widget.title),
        //Actions du AppBar
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white),
                onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => new Cart()
                    )
                );
              }),
          new IconButton(icon: Icon(Icons.person ,color: Colors.white),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => new LoginPage()
                    )
                );
              })
          ,

        ],
      ),
      //Drawer
      drawer: MenuDrawer(),
      body:new ListView(
        children: <Widget>[
          //Carousel
          CarosselWidget(),
          //Titre de la Partie Catégorie
          new Padding(
              padding: const EdgeInsets.all(8.0),
             child: Text("Catégories",
             style:TextStyle(
               fontSize: 20.0,
               color: Colors.grey,
               fontWeight: FontWeight.bold
             ),),
          ),
          //Liste des Catégories
         new ListCategorieProduct(),
          new Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Nouvel Arrivage",
              style:TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
              ),),
          ),
          //Liste des Produits Recents


           ListProduct() ,



        ],
      )

    );
  }
}
