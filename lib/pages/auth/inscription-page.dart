import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/categorie-model.dart';
import 'package:flutter_ecommerce/models/user-model.dart';
import 'package:flutter_ecommerce/pages/auth/login_page.dart';
import 'package:flutter_ecommerce/pages/home/home.dart';
import 'package:flutter_ecommerce/services/auth-service.dart';
import 'package:flutter_ecommerce/services/categorie-service.dart';
import 'package:flutter_ecommerce/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  String  email='';
  String  pwd='';
  String error="";
  bool loading=false;
  SharedPreferences preferences;

  final AuthService _auth=AuthService();

  //Recuperer de Etat du Formulaire
  final _formKey=GlobalKey<FormState>();



  //Fonction de connexion
  Future  handleIsConnect() async{

    setState(() {
      loading=true;
    });
    preferences = await SharedPreferences.getInstance();

    User result=await _auth.ConnexionUser(email, pwd);

    if(result==null){
      setState(() {
        error="Email ou Mot de Passe Incorrect";

      });

    }else{
      //
      await preferences.setString("id", result.uid );
      preferences.setString("login", result.login);
      preferences.setString("pwd", result.pwd);
      preferences.setString("adresse", result.adresse);
      preferences.setString("fullName", result.fullName);
      preferences.setString("avatar", result.avatar);
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => new MyHomePage(title: "Kay Djeunde",)
          )
      );
    }

    setState(() {
      loading=false;
    });


  }


  Widget build(BuildContext context) {
    return  loading? LoadingWidget() :Scaffold(

      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        //Retour vers la Page Home
        title: InkWell(
          onTap:() {

          },
          child: Text("Creation de Compte "),
        ),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => new LoginPage()
                )
            );
          },
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text("Connexion",style: TextStyle(
                color: Colors.white,
                fontSize: 14.0
              ),)
          )
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        /*child: RaisedButton(
               child: Text("Connexion Annonyme"),
                onPressed: isConnectAnnonyme,
        ),*/
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  //labelText: "Login *",
                 hintText: "Email *",
                  icon: Icon(Icons.email),
                  hintStyle: TextStyle(
                    color:Colors.red
                  )
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value)=>value.isEmpty ? "Entrer le Email":null,
                onChanged: (value){
                  setState(() {
                    email=value;
                  });

                },
              ),
              SizedBox(height: 20.0,),
              Material(
                borderRadius: BorderRadius.circular(40.0),
                elevation: 0.0,
                child: TextFormField(
                    decoration: InputDecoration(
                        //labelText: "Mot de Passe *"
                        hintText: "Mot de Passe *",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                            color:Colors.red
                        ),
                        icon: Icon(Icons.lock_outline)
                    ),

                  validator: (value)=>value.length<6 ? "Le Mot de Passe doit contenir au moins 6 caracteres":null,
                  obscureText: true,
                  onChanged: (value){
                      setState(() =>pwd=value);
                  },
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(200.0, 5.0,  0.0, 0.0),
                child: RaisedButton(
                  color:Colors.red[500],
                  onPressed: ()async{
                    if(_formKey.currentState.validate()){
                      setState(() {
                        loading=true;
                      });
                         User result=await _auth.inscriptionUser(email, pwd,"Diop","Thies");

                       if(result==null){
                         setState(() {
                           error="Email ou Mot de Passe Incorrect";
                         });

                       }else{
                         await handleIsConnect();
                         setState(() {
                           error="";
                         });
                       }
                      setState(() {
                        loading=false;
                      });
                    }

                  },
                  child: Text("Inscription",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      )),


                ),
              ),
              SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: error.isEmpty?null:Text(error,
                  style:TextStyle(
                       color: Colors.red,
                       fontSize: 14.0
                  )
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}
