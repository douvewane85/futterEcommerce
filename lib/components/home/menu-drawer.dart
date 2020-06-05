import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/home/menuItem-widget.dart';
import 'package:flutter_ecommerce/models/user-model.dart';
import 'package:flutter_ecommerce/pages/panier/cart_page.dart';
import 'package:flutter_ecommerce/services/auth-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/home/home.dart';
import 'package:flutter_ecommerce/pages/auth/inscription-page.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final AuthService _auth=AuthService();
  SharedPreferences preferences ;
  bool isLogin=false;
  User user=null;
  final menuHome=[
    {'etat':'all','title':"Accueil",'icon':Icon(Icons.home,color: Colors.red,),'page':new MyHomePage(title: "Kay Djeunde",)},
    {'etat':'all','title':"Mon Compte",'icon':Icon(Icons.person,color: Colors.red),'page':new Inscription()},
    {'etat':'isLogin','title':"Mes Commandes",'icon':Icon(Icons.shopping_basket,color: Colors.red),'page':new Inscription()},
    {'etat':'isLogin','title':"Mon Panier",'icon':Icon(Icons.shopping_cart,color: Colors.red),'page':new Inscription()},
    {'etat':'isLogin','title':"Mes Favoris",'icon':Icon(Icons.favorite,color: Colors.red),'page':new Inscription()},
    {'etat':'all','title':"Parametres",'icon':Icon(Icons.settings,color: Colors.red),'page':new Inscription()},
    {'etat':'all','title':"Aide",'icon':Icon(Icons.help,color: Colors.red),'page':new Inscription()},

  ];



  @override
  Future<void> initState(){
    // TODO: implement initState
    super.initState();


  }



  @override
  Widget build(BuildContext context) {


    _auth.user.first.then((value){

      if(value!=null){
        setState((){
          isLogin=true;

        });
      }else{

        isLogin=false;
      }

    });

    return new Drawer(

      child: ListView(
        children: <Widget>[
          //Header du Drawwer
          new UserAccountsDrawerHeader(
            accountName: isLogin ?Text(user.uid):Text(""),
            accountEmail: isLogin ?Text(user.login):Text(""),
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

          ...this.menuHome.map((item){


              return MenuItem(
                menuTitle: item['title'],
                menuIcon: item['icon'],
                show:item['etat'].toString().compareTo("all")==0?true:isLogin,
                handler: (context){

                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => item['page']
                      )
                  );
                },
              );

          }),



          Padding(
            padding: const EdgeInsets.all(0.0),
            child: isLogin==false?null:InkWell(
              onTap: () async{
                 await  _auth.deconnexion();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => new MyHomePage(title: "Kay Djeund")
                    )
                );
                setState(() {
                  isLogin=false;
                });
              },
              //Modification du Jour
              child: ListTile(
                title:Text("Deconnexion"),
                leading: Icon(Icons.person,color: Colors.red),

              ),
            ),
          ),




        ],
      ),
    );;
  }
}
