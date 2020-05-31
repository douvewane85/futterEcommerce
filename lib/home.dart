import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//Mes Packadges
import 'package:flutter_ecommerce/components/listeView_categories.dart';

import 'package:flutter_ecommerce/components/gridView_products.dart';
import 'package:flutter_ecommerce/pages/cart_page.dart';
import 'package:flutter_ecommerce/pages/inscription-page.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/services/auth-service.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final AuthService _auth=AuthService();
   bool isLogin=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _auth.user.first.then((value) => value!=null ? isLogin=true:isLogin=false);

  }
  @override
  Widget build(BuildContext context) {
  //Widget Carousel
    Widget image_carousel=new Container(
      height: 200.0,
      child: new Carousel(

        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotColor: Colors.red,
        dotBgColor: Colors.transparent,
      ),
    );

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
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            //Header du Drawwer
            new UserAccountsDrawerHeader(
                    accountName: Text("Birane Baila "),
                    accountEmail: Text("douvewane85@gmail.com"),
                     //Image du User Connecté
                     currentAccountPicture: GestureDetector(
                       child: new CircleAvatar(
                         backgroundColor: Colors.grey,
                         child: Icon(Icons.person,color: Colors.white,),
                       ),
                     ),
              decoration: new BoxDecoration(
                    color: Colors.red,

              ),
            ),

             //Body du Drawer

            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => new MyHomePage(title: "Kay Djeunde",)
                    )
                );
              },
              child: ListTile(
                title:Text("Accueil"),
                leading: Icon(Icons.home,color: Colors.red,),

              ),
            ),
            InkWell(
              onTap: (){


                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => new Inscription()
                    )
                );

              },
              child: ListTile(
                title:Text("Mon Compte"),
                leading: Icon(Icons.person,color: Colors.red),

              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text("Mes Commandes"),
                leading: Icon(Icons.shopping_basket,color: Colors.red),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: isLogin==false?null:InkWell(
                onTap: (){

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => new Cart()
                      )
                  );
                },
                //Modification du Jour
                child: ListTile(
                  title:Text("Mon Panier"),
                  leading: Icon(Icons.shopping_cart,color: Colors.red),

                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text("Mes Favoris"),
                leading: Icon(Icons.favorite,color: Colors.red),

              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text("Parametres"),
                leading: Icon(Icons.settings,color: Colors.grey),

              ),
            ),
            InkWell(
              onTap: () async{
               await  _auth.deconnexion();
              },
              child: ListTile(
                title:Text("Deconnexion"),
                leading: Icon(Icons.person,color: Colors.grey),

              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text("About"),
                leading: Icon(Icons.help,color: Colors.blue),

              ),
            )

          ],
        ),
      ),
      body:new ListView(
        children: <Widget>[
          //Carousel
          image_carousel,
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
          Container(
            height: 320.0,
            child: ListProduct() ,
          )


        ],
      )

    );
  }
}
